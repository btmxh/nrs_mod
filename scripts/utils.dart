import 'dart:convert';
import 'dart:io';

import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:nrs_mod/nrs_mod.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

class FileSource {
  Source source;
  String path;
  FileSource(this.source, this.path);

  static Future<FileSource> create(String path) async {
    final source = await File(path).readAsLines();
    return FileSource(source, path);
  }

  Future<void> save() async {
    final lineBreak = Platform.isWindows ? "\r\n" : "\n";
    final content = source.join(lineBreak) + lineBreak;
    await File(path).writeAsString(content);
  }
}

class NullableFileSourceBlock {
  SourceBlock? block;
  FileSource file;
  NullableFileSourceBlock(this.block, this.file);

  FileSourceBlock toNonNullable() {
    return FileSourceBlock(block!, file);
  }
}

class FileSourceBlock {
  SourceBlock block;
  FileSource file;
  FileSourceBlock(this.block, this.file);
}

class EntryBlockFinder {
  Map<String, FileSource> openedFiles;
  Map<String, List<ListChange>> patches = {};

  EntryBlockFinder._create(this.openedFiles);

  static Future<EntryBlockFinder> create(String nrsImplPath) async {
    final openedFiles = <String, FileSource>{};
    final sources = await Glob("**.kt", recursive: true)
        .list(root: p.join(nrsImplPath, "impl"))
        .asyncMap((fse) => FileSource.create(fse.path))
        .forEach((fs) => openedFiles[fs.path] = fs);
    return EntryBlockFinder._create(openedFiles);
  }

  FileSourceBlock? findEntryBlock(String id) {
    try {
      return openedFiles.values
          .map((f) => NullableFileSourceBlock(getEntryBlock(f.source, id), f))
          .firstWhere((fsb) => fsb.block != null)
          .toNonNullable();
    } catch (_) {
      return null;
    }
  }

  Map<String, FileSourceBlock> getAllIDs() {
    final res = <String, FileSourceBlock>{};
    for (final fs in openedFiles.values) {
      res.addAll(getAllEntryIDs(fs.source)
          .map((key, value) => MapEntry(key, FileSourceBlock(value, fs))));
    }
    return res;
  }

  void submitPatch(String filename, Iterable<ListChange> changes) {
    patches.putIfAbsent(filename, () => []).addAll(changes);
  }

  Future<void> patch() async {
    for (final filename in openedFiles.keys) {
      final fs = openedFiles[filename]!;
      final patch = patches[filename];
      if (patch != null) {
        patchList(fs.source, patch);
        await fs.save();
      }
    }
  }
}

Future<dynamic> loadVGMDB(http.Client client, String route) async {
  final source = await _loadVGMDBString(client, route);
  if (source == null) {
    return null;
  }

  return jsonDecode(source);
}

Uri buildVGMDBUri(String route) {
  return Uri.parse('http://127.0.0.1:9990$route?format=json');
  // return Uri.https("vgmdb.info", route);
}

Future<String?> _loadVGMDBString(http.Client client, String route) async {
  final cacheFile = File(".vgmdb-cache$route");
  cacheFile.parent.create(recursive: true);
  if (cacheFile.existsSync()) {
    return cacheFile.readAsStringSync();
  }

  final response = await client.get(buildVGMDBUri(route));
  if (response.statusCode ~/ 100 != 2) {
    print("HTTP Error: ${response.statusCode}. Body: ${response.body}");
  }

  if (!cacheFile.existsSync()) {
    cacheFile.writeAsStringSync(response.body);
  }
  return response.body;
}

String? stripPrefix(String s, String prefix) {
  return s.startsWith(prefix) ? s.substring(prefix.length) : null;
}

bool isIgnoreLine(String? s, String filename, String version) {
  return s != null &&
      (s.contains("generated($filename v$version)") ||
          s.contains("impl_overridden"));
}
