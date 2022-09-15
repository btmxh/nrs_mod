import 'dart:io';
import 'package:nrs_mod/nrs_mod.dart';

import 'utils.dart';

void main(List<String> args) async {
  if (args.length != 1) {
    print(
        "Usage: [dart run] scripts/find_by_id.dart <path-to-nrs-impl-kt> <id-to-search>");
    exit(1);
  }

  String id = args[1];
  final finder = await EntryBlockFinder.create(args[0]);
  final location = finder.findEntryBlock(id);
  if (location != null) {
    print("File: ${location.file.path}:${location.block.range.from.line + 1}");
    print("Block: ${location.block}");
    print("Source:");
    print(SourceBlockLineNumIterable(location.block, location.file.source)
        .map((i) => location.file.source[i])
        .join("\n"));
  } else {
    print("Not found");
  }
}
