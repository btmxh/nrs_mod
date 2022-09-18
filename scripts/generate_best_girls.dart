import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nrs_mod/nrs_mod.dart';

import 'utils.dart';

const filename = 'generate_best_girls.dart';
const version = '0.1.0';

String generatedLine(String s) {
  return "$s // generated($filename v$version)";
}

bool ignoreLine(String? s) {
  return isIgnoreLine(s, filename, version);
}

void main(List<String> args) async {
  if (args.length != 1) {
    print("Usage: [dart run] best_girls.dart <path-to-nrs-impl-kt>");
    exit(1);
  }
  final client = http.Client();
  final finder = await EntryBlockFinder.create(args[0]);
  final ids = finder.getAllIDs();
  for (final id in ids.keys) {
    try {
      final location = ids[id]!;
      final source = location.file.source;
      final lineNumbers = SourceBlockLineNumIterable(location.block, source);
      final lineNumber =
          findLineNumber(EntryLine.bestGirl, lineNumbers, source);
      if (lineNumber == null) {
        continue;
      }

      final line = source[lineNumber];
      if (isIgnoreLine(line, filename, version)) {
        continue;
      }

      final match = RegExp(r'bestGirl\s*=\s*"(.*?)"').firstMatch(line);
      if (match == null) {
        continue;
      }

      final name = match.group(1)!;
      final canonName = await getBestGirlCanonicalName(client, name);
      if (canonName == null) {
        print("$name -x> null");
      }

      final indent = location.block.indentation;
      final newLine = generatedLine("${indent}bestGirl = \"$canonName\"");
      print("$name -> $canonName");
      finder.submitPatch(location.file.path, [
        ListChange(lineNumber, lineNumber + 1, [newLine])
      ]);

      sleep(Duration(seconds: 1));
    } catch (e) {
      print("Error: $e");
    }
  }

  await finder.patch();
}

Future<String?> getBestGirlCanonicalName(
    http.Client client, String name) async {
  final searchResult =
      await jikanCall(client, "characters", {"q": name, "limit": "1"});
  final list = searchResult?['data'];
  if (list?.isNotEmpty) {
    return list?[0]?['name'];
  }
}

Future<dynamic> jikanCall(http.Client client, String route,
    [Map<String, dynamic>? queryParams]) async {
  final response =
      await client.get(Uri.https("api.jikan.moe", "/v4/$route", queryParams));
  if (response.statusCode ~/ 100 != 2) {
    print("HTTP Error: ${response.statusCode}. Body: ${response.body}");
    return null;
  }

  return jsonDecode(response.body);
}
