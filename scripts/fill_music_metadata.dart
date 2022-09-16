import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nrs_mod/src/lines.dart';
import 'package:nrs_mod/src/parse.dart';
import 'package:nrs_mod/src/patch.dart';

import 'utils.dart';

const filename = "fill_music_metadata.dart";
const version = "0.1.1";

bool ignoreLine(String? s) {
  return isIgnoreLine(s, filename, version);
}

void main(List<String> args) async {
  if (args.length != 1 && args.length != 2) {
    print(
        "Usage: [dart run] scripts/$filename <path-to-nrs-impl-kt> [<vgmdb-api-prefix>]");
    exit(1);
  }

  final client = http.Client();
  final finder = await EntryBlockFinder.create(args[0]);
  final ids = finder.getAllIDs();
  final vgmdbApiPrefix = args.length == 2 ? args[1] : "https://vgmdb.info";
  for (final id in ids.keys) {
    if (!id.startsWith("M-VGMDB")) {
      continue;
    }

    final tokens = id.split('-');
    late final apiResult = loadVGMDB(client, vgmdbApiPrefix,
        (tokens[2] == 'AL' ? "/album/" : "/artist/") + tokens[3]);

    final location = ids[id]!;

    print("Processing entry $id");
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

      if (id.contains("M-VGMDB-AR") &&
          !ignoreLine(findLine(EntryLine.title, lineNumbers, source))) {
        final name = (await apiResult)["name"];
        changes.add(ListChange.fromRange(titleChangeRange,
            [generatedLine("${indent}title = ${quote(name)}")]));
      }

      if (id.contains("M-VGMDB-AL")) {
        if (!ignoreLine(findLine(EntryLine.title, lineNumbers, source))) {
          if (tokens.length == 5) {
            // song entry
            final songs = (await apiResult)["discs"]
                .expand((d) => d["tracks"] as Iterable<dynamic>)
                .toList();
            final track = songs[int.parse(tokens[4]) - 1];
            final names = track["names"];
            final name =
                names["Romaji"] ?? names["Japanese"] ?? names["English"];
            changes.add(ListChange.fromRange(titleChangeRange,
                [generatedLine("${indent}title = ${quote(name)}")]));
          } else {
            final names = (await apiResult)["names"];
            final name = names["ja-latn"] ?? names["ja"] ?? names["en"];
            changes.add(ListChange.fromRange(titleChangeRange,
                [generatedLine("${indent}title = ${quote(name)}")]));
          }
        }

        if (tokens.length == 5 &&
            !ignoreLine(findLine(EntryLine.progress, lineNumbers, source))) {
          final songs = (await apiResult)["discs"]
              .expand((d) => d["tracks"] as Iterable<dynamic>)
              .toList();
          final trackLength = songs[int.parse(tokens[4]) - 1]['track_length'];
          changes.add(ListChange.fromRange(
              getInsertLineRange(lineNumbers, source, [
                InsertPosition(EntryLine.consumed, InsertKind.override),
                InsertPosition(EntryLine.title, InsertKind.after),
                InsertPosition(EntryLine.id, InsertKind.after),
                InsertPosition(EntryLine.firstLine, InsertKind.before),
              ])!,
              [
                generatedLine('${indent}MusicConsumedProgress("$trackLength")')
              ]));
        }
      }

      finder.submitPatch(location.file.path, changes);
    } catch (e) {
      print("Error: $e");
    }
  }

  await finder.patch();
}

String quote(String s) {
  return "\"${s.replaceAll("\"", "\\\"")}\"";
}

String generatedLine(String s) {
  return "$s // generated($filename v$version)";
}
