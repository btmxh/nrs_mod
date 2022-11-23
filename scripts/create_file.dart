import 'package:path/path.dart' as p;
import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print("Usage: [dart run] create_file.dart [filepath]");
    exit(1);
  }

  final path = args.first;
  final template = await File("res/template.kt").readAsString();

  final tokens = path.split('.');
  if (tokens.isEmpty) {
    print("Empty argument");
    exit(2);
  }

  final name = tokens.removeLast();
  final packagePath = tokens.join('.');

  final content = template
      .replaceAll("\$PATH", packagePath.isNotEmpty ? ".$packagePath" : "")
      .replaceAll("\$NAME", name);
  final filePath = p.joinAll([
    "..",
    "impl/src/main/kotlin/com/dah/nrs/",
    tokens.isEmpty? "." : tokens.join('/'),
    "$name.kt"
  ]);

  await File(filePath).writeAsString(content);
}
