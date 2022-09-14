import 'package:nrs_mod/nrs_mod.dart';

enum EntryLine {
  firstLine,
  id,
  idMAL,
  idAniList,
  idKitsu,
  idAniDB,
  title,
  bestGirl,
  lastLine,
  progress,
  consumed,
}

int _findLine(
    EntryLine lineKind, Iterable<int> lineNumbers, List<String> source) {
  final regexMap = {
    EntryLine.id: RegExp(r'id\s*='),
    EntryLine.title: RegExp(r'title\s*='),
    EntryLine.bestGirl: RegExp(r'bestGirl\s*='),
    EntryLine.idMAL: RegExp(r'idMAL\s*='),
    EntryLine.idAniList: RegExp(r'idAniList\s*='),
    EntryLine.idKitsu: RegExp(r'idKitsu\s*='),
    EntryLine.idAniDB: RegExp(r'idAniDB\s*='),
    EntryLine.progress: RegExp(r'(?:Consumed)?Progress\(.*\)'),
    EntryLine.consumed: RegExp(r'Consumed(?:Progress)?\(.*\)'),
  };

  switch (lineKind) {
    case EntryLine.firstLine:
      return lineNumbers.first;
    case EntryLine.lastLine:
      return lineNumbers.last;
    default:
      final num = lineNumbers.lastWhere(
          (lineNum) =>
              regexMap[lineKind]!.hasMatch(trimSource(source[lineNum])),
          orElse: () => -1);
      if (num < 0 && lineKind == EntryLine.id) {
        return lineNumbers.first - 1;
      }

      return num;
  }
}

int? findLineNumber(
    EntryLine lineKind, Iterable<int> lineNumbers, List<String> source) {
  final num = _findLine(lineKind, lineNumbers, source);
  return num < 0 ? null : num;
}

String? findLine(
    EntryLine lineKind, Iterable<int> lineNumbers, List<String> source) {
  final lineNumber = findLineNumber(lineKind, lineNumbers, source);
  if (lineNumber == null) {
    return null;
  }
  return source[lineNumber];
}
