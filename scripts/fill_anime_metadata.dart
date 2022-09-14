import 'dart:convert';
import 'dart:io';
import 'package:nrs_mod/src/lines.dart';
import 'package:nrs_mod/src/parse.dart';
import 'package:nrs_mod/src/patch.dart';

import 'utils.dart';

const filename = "fill_anime_metadata.dart";
const version = "0.1.1";

class Anime {
  String? mal;
  String? anilist;
  String? kitsu;
  String? anidb;
  String title;
  int episodes;
  Anime(this.title, this.episodes);
}

String? stripPrefix(String s, String prefix) {
  return s.startsWith(prefix) ? s.substring(prefix.length) : null;
}

bool ignoreLine(String? s) {
  return s != null &&
      (s.contains("generated($filename v$version)") ||
          s.contains("impl_overridden"));
}

Future<Map<String, Anime>> createAnimeIDMap() async {
  final aod = jsonDecode(await File(
          '../anime-offline-database/anime-offline-database-minified.json')
      .readAsString());
  final map = <String, Anime>{};
  for (final anime in aod["data"]) {
    final sources = anime["sources"];
    final a = Anime(anime["title"], anime["episodes"]);
    for (final source in sources) {
      a.mal ??= stripPrefix(source, "https://myanimelist.net/anime/");
      a.anilist ??= stripPrefix(source, "https://anilist.co/anime/");
      a.kitsu ??= stripPrefix(source, "https://kitsu.io/anime/");
      a.anidb ??= stripPrefix(source, "https://anidb.net/anime/");
    }
    if (a.mal != null) {
      map[a.mal!] = a;
    }
  }
  return map;
}

void main() async {
  final aodMap = await createAnimeIDMap();
  final finder = await EntryBlockFinder.create();
  final ids = finder.getAllIDs();
  for (final id in ids.keys) {
    if (!id.startsWith("A-MAL")) {
      continue;
    }

    final location = ids[id]!;

    try {
      final indent = location.block.indentation;
      final lineNumbers =
          SourceBlockLineNumIterable(location.block, location.file.source)
              .toList();
      final source = location.file.source;

      final changes = <ListChange<String>>[];
      final titleChangeRange = getInsertLineRange(lineNumbers, source, [
        InsertPosition(EntryLine.title, InsertKind.override),
        InsertPosition(EntryLine.id, InsertKind.after),
        InsertPosition(EntryLine.firstLine, InsertKind.before),
      ])!;

      print("Processing entry $id");
      if (id.contains("A-MAL")) {
        final malId = id.split("-")[2];
        final anime = aodMap[malId];
        if (anime != null) {
          if (anime.mal != null &&
              !ignoreLine(findLine(EntryLine.idMAL, lineNumbers, source))) {
            changes.add(ListChange.fromRange(
                getInsertLineRange(lineNumbers, source, [
                  InsertPosition(EntryLine.idMAL, InsertKind.override),
                  InsertPosition(EntryLine.id, InsertKind.after),
                  InsertPosition(EntryLine.firstLine, InsertKind.before),
                ])!,
                [generatedLine("${indent}idMAL = ${anime.mal}")]));
          }
          if (anime.anilist != null &&
              !ignoreLine(findLine(EntryLine.idAniList, lineNumbers, source))) {
            changes.add(ListChange.fromRange(
                getInsertLineRange(lineNumbers, source, [
                  InsertPosition(EntryLine.idAniList, InsertKind.override),
                  InsertPosition(EntryLine.id, InsertKind.after),
                  InsertPosition(EntryLine.firstLine, InsertKind.before),
                ])!,
                [generatedLine("${indent}idAniList = ${anime.anilist}")]));
          }
          if (anime.kitsu != null &&
              !ignoreLine(findLine(EntryLine.idKitsu, lineNumbers, source))) {
            changes.add(ListChange.fromRange(
                getInsertLineRange(lineNumbers, source, [
                  InsertPosition(EntryLine.idKitsu, InsertKind.override),
                  InsertPosition(EntryLine.id, InsertKind.after),
                  InsertPosition(EntryLine.firstLine, InsertKind.before),
                ])!,
                [generatedLine("${indent}idKitsu = ${anime.kitsu}")]));
          }
          if (anime.anidb != null &&
              !ignoreLine(findLine(EntryLine.idAniDB, lineNumbers, source))) {
            changes.add(ListChange.fromRange(
                getInsertLineRange(lineNumbers, source, [
                  InsertPosition(EntryLine.idAniDB, InsertKind.override),
                  InsertPosition(EntryLine.id, InsertKind.after),
                  InsertPosition(EntryLine.firstLine, InsertKind.before),
                ])!,
                [generatedLine("${indent}idAniDB = ${anime.mal}")]));
          }
          if (!ignoreLine(findLine(EntryLine.title, lineNumbers, source))) {
            changes.add(ListChange.fromRange(
                getInsertLineRange(lineNumbers, source, [
                  InsertPosition(EntryLine.title, InsertKind.override),
                  InsertPosition(EntryLine.id, InsertKind.after),
                  InsertPosition(EntryLine.firstLine, InsertKind.before),
                ])!,
                [generatedLine("${indent}title = ${quote(anime.title)}")]));
          }
          final progressLine =
              findLine(EntryLine.progress, lineNumbers, source);
          final progressRegex = RegExp(r'Progress\(Boredom\.([A-Za-z]+)\)');
          if (progressLine != null &&
              progressRegex.hasMatch(progressLine) &&
              !ignoreLine(progressLine)) {
            final progress = progressRegex.firstMatch(progressLine)!.group(1)!;
            final numEpisodes = anime.episodes;
            final level = changes.add(ListChange.fromRange(
                getInsertLineRange(lineNumbers, source,
                    [InsertPosition(EntryLine.progress, InsertKind.override)])!,
                [
                  generatedLine(progressLine.replaceFirst(
                      progress, "$progress, $numEpisodes"))
                ]));
          }
        }
      }

      patchList(location.file.source, changes);
    } catch (e) {
      print("Error: $e");
    }
  }

  for (final fs in finder.openedFiles.values) {
    await fs.save();
  }
}

String quote(String s) {
  return "\"${s.replaceAll("\"", "\\\"")}\"";
}

String generatedLine(String s) {
  return "$s // generated($filename v$version)";
}
