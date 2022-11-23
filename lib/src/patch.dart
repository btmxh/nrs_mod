import 'dart:math';

import 'lines.dart';

class ListChange<T> {
  int from;
  int to;
  Iterable<T> data;
  ListChange(this.from, this.to, this.data);

  ListChange.fromRange(Range range, this.data)
      : from = range.from,
        to = range.to;
}

void stableSort<T>(List<T> list, int Function(T, T) compare) {
  // naive bubble sort, may be optimized if needed
  for(var i = 0; i < list.length; i++) {
    for(var j = i + 1; j < list.length; j++) {
      if(compare(list[i], list[j]) > 0) {
        final temp = list[i];
        list[i] = list[j];
        list[j] = temp;
      }
    }
  }
}

List<ListChange<T>> _normalizeListChanges<T>(Iterable<ListChange<T>> changes) {
  // sort the changelist in reverse order
  final list = List<ListChange<T>>.from(changes.toList().reversed);
  stableSort<ListChange<T>>(list, (c1, c2) => c2.from.compareTo(c1.from));
  for (int i = list.length - 1; i - 1 >= 0; i--) {
    final c1 = list[i];
    final c2 = list[i - 1];
    // check for overlapping ranges
    if (c1.from <= c2.to && c2.from <= c1.to) {
      final from = min(c1.from, c2.from);
      final to = min(c1.to, c2.to);
      final data = c1.data.toList();
      data.addAll(c2.data);
      list[i - 1] = ListChange(from, to, data);
      list.removeAt(i);
    }
  }
  return list;
}

void applyChange<T>(List<T> list, ListChange<T> change) {
  list.removeRange(change.from, change.to);
  list.insertAll(change.from, change.data);
}

void patchList<T>(List<T> list, Iterable<ListChange<T>> changes) {
  for (final change in _normalizeListChanges(changes)) {
    applyChange(list, change);
  }
}

enum InsertKind { before, override, after }

class InsertPosition {
  EntryLine line;
  InsertKind insertKind;
  InsertPosition(this.line, this.insertKind);
}

class Range {
  int from;
  int to;
  Range(this.from, this.to);
}

Range? _getInsertLineRangeSingle(
    Iterable<int> lineNumbers, List<String> source, InsertPosition position) {
  final lineNumber = findLineNumber(position.line, lineNumbers, source);
  if (lineNumber == null) {
    return null;
  }
  switch (position.insertKind) {
    case InsertKind.override:
      return Range(lineNumber, lineNumber + 1);
    case InsertKind.before:
      return Range(lineNumber, lineNumber);
    case InsertKind.after:
      return Range(lineNumber + 1, lineNumber + 1);
  }
}

Range? getInsertLineRange(Iterable<int> lineNumbers, List<String> source,
    List<InsertPosition> positions,
    {bool override = false}) {
  return positions.isEmpty
      ? null
      : (_getInsertLineRangeSingle(lineNumbers, source, positions.first) ??
          getInsertLineRange(lineNumbers, source, positions.sublist(1)));
}
