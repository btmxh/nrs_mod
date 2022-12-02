import 'dart:math';

class SourceLocation {
  int line;
  int col;
  SourceLocation(this.line, this.col);
  @override
  String toString() {
    return "{ line: $line, col: $col }";
  }
}

class SourceRange {
  SourceLocation from;
  SourceLocation to;
  SourceRange(this.from, this.to);
  @override
  String toString() {
    return "{ from: $from, to: $to }";
  }
}

typedef Source = List<String>;

class SourceBlock {
  SourceRange range;
  String indentation;
  SourceBlock(this.range, this.indentation);
  @override
  String toString() {
    return "{ range: $range, indentation: '${indentation.replaceAll('\t', '\\t')}' }";
  }
}

class SourceBlockLineNumIterable extends Iterable<int> {
  SourceBlock block;
  Source source;
  SourceBlockLineNumIterable(this.block, this.source);

  @override
  Iterator<int> get iterator => SourceBlockLineNumIterator(this);
}

class SourceBlockLineNumIterator extends Iterator<int> {
  SourceBlockLineNumIterable itr;
  int currentLineRelativeIndex = 0;
  int nestingLevel = 0;
  SourceBlockLineNumIterator(this.itr);
  @override
  int get current {
    assert(nestingLevel == 0);
    return itr.block.range.from.line + currentLineRelativeIndex;
  }

  @override
  bool moveNext() {
    do {
      ++currentLineRelativeIndex;
      if (currentLineRelativeIndex >=
          itr.block.range.to.line - itr.block.range.from.line) {
        return false;
      }
      final line = trimSource(
          itr.source[itr.block.range.from.line + currentLineRelativeIndex]);
      nestingLevel += processBraceDelta(line);
    } while (nestingLevel != 0);
    return true;
  }
}

int processBraceDelta(String line) {
  final regex = RegExp("nrs_mod\\(nesting=(-?\\d+)\\)");
  final mods = regex.allMatches(line);
  if (mods.isNotEmpty) {
    return mods.map((m) => int.parse(m.group(1)!)).reduce((a, b) => a + b);
  }

  line = trimSource(line);
  if(line.endsWith("{")) {
    return -1;
  } else if(line.endsWith("}") && !line.contains("{")) {
    return 1;
  }

  return 0;
}

SourceLocation? _findLBrace(Source source, int lineNum) {
  int nestingLevel = 0;
  for (int i = lineNum - 1; i >= 0; i--) {
    final line = source[i];
    nestingLevel += processBraceDelta(line);
    if (nestingLevel < 0) {
      int col = line.lastIndexOf("{");
      return SourceLocation(i, col);
    }
  }
  return null;
}

SourceLocation? _findRBrace(Source source, int lineNum) {
  int nestingLevel = 0;
  for (int i = lineNum; i < source.length; i++) {
    final line = source[i];
    nestingLevel += processBraceDelta(line);
    if (nestingLevel > 0) {
      int col = line.lastIndexOf("}");
      if(col == -1) {
        col = line.length;
      }
      return SourceLocation(i, col);
    }
  }
  return null;
}

SourceRange? _findBlock(Source source, int line) {
  SourceLocation? from = _findLBrace(source, line);
  SourceLocation? to = _findRBrace(source, line);
  if (from == null || to == null) {
    return null;
  }

  return SourceRange(from, to);
}

String _getLineIndentation(String line) {
  String indentation = "";
  for (int i = 0; i < line.length; i++) {
    final c = line[i];
    if (c.trim() == "") {
      if (c == "\t" || c == " ") {
        indentation += c;
      }
    } else {
      return indentation;
    }
  }
  return indentation;
}

SourceBlock? getEntryBlock(Source source, String id) {
  final idRegex = RegExp("id\\s*=\\s*\"$id\"");
  final vgmdbMusicIdRegex = RegExp("M-VGMDB-AL-\\d+-\\d+");
  int idLine = source.indexWhere((line) => idRegex.hasMatch(trimSource(line)));
  String indentation = "";
  if (idLine < 0) {
    // SubIDEntry
    if (vgmdbMusicIdRegex.hasMatch(id)) {
      final tokens = id.split("-");
      final albumId = "M-VGMDB-AL-${tokens[3]}";
      final albumBlock = getEntryBlock(source, albumId);
      if (albumBlock == null) {
        return null;
      }

      final albumRange = albumBlock.range;
      final subId = tokens[4];
      final subIdRegex = RegExp("SubIDEntry\\(\"$subId\"");
      final albumLines = source.sublist(
          albumRange.from.line, min(albumRange.to.line + 1, source.length));
      idLine = albumLines.indexWhere((line) => subIdRegex.hasMatch(line));
      if (idLine >= 0) {
        indentation = _getLineIndentation(albumLines[idLine]);
        indentation += "    ";
        idLine += albumRange.from.line + 1;
        // the `SubIDEntry("1", "Asuiro Fuck My Ass")` line is not in the block
        // and the next line should be in the block
      }
    }

    if (idLine < 0) {
      return null;
    }
  } else {
    indentation = _getLineIndentation(source[idLine]);
  }

  final range = _findBlock(source, idLine);
  if (range == null) {
    return null;
  }
  return SourceBlock(range, indentation);
}

SourceBlock? getFileMainFunction(List<String> content, int lineIndex) {
  final indentation = _getLineIndentation(content[lineIndex]);
  final range = _findBlock(content, lineIndex);
  if (range == null) {
    return null;
  }
  return SourceBlock(range, indentation);
}

String trimSource(String source) {
  return source
      .replaceAll(RegExp("(?:/\\*(?:[^*]|(?:\\*+[^*/]))*\\*+/)|(?://.*)"), "")
      .trim();
}

Map<String, SourceBlock> getAllEntryIDs(Source source) {
  final idRegex = RegExp(r'id\s*=\s*"([A-Z0-9-]+)"');
  final subidRegex = RegExp(r'SubIDEntry\("(.*)"');
  final entryIDs = source.expand((line) {
    final match = idRegex.firstMatch(line);
    final id = match?.group(1);
    return id == null ? <String>[] : [id];
  });

  final entryBlocks = {
    for (final id in entryIDs) id: getEntryBlock(source, id)!
  };

  final subentryBlocks = <String, SourceBlock>{};
  entryBlocks.forEach((id, block) {
    final lines = source.sublist(block.range.from.line, block.range.to.line);
    for (final line in lines) {
      final match = subidRegex.firstMatch(line);
      if (match == null) {
        continue;
      }

      final subentryID = "$id-${match.group(1)!}";
      // can be optimized further
      final block = getEntryBlock(source, subentryID);
      if (block != null) {
        subentryBlocks[subentryID] = block;
        if (block.range.from == block.range.to) {
          print("??");
        }
      }
    }
  });
  entryBlocks.addAll(subentryBlocks);
  return entryBlocks;
}
