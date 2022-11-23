import 'package:path/path.dart' as p;
import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print("Usage: [dart run] create_file.dart [--force|-f] [filepath]");
    exit(1);
  }

  final path = args.last;
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
  final file = File(p.joinAll([
    "..",
    "impl/src/main/kotlin/com/dah/nrs/",
    tokens.isEmpty? "." : tokens.join('/'),
    "$name.kt"
  ]));

  if(file.existsSync()) {
    print("WARN: $file already exists");
    if(!args.contains("-f") && !args.contains("--force")) {
      exit(1);
    }
  }

  file.writeAsString(content);
}
