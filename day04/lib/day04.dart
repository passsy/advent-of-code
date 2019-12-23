import 'package:aoc_common/aoc_common.dart';
import 'package:dartx/dartx.dart';

List<int> possiblePasswords(int start, int end) {
  return start
      .rangeTo(end)
      .filter((it) => it.isSixDigitNumber)
      .filter((it) => it.hasDoubleDigit)
      .filter((it) => it.neverDecreases)
      .toList();
}

extension Criteria on int {
  bool get isSixDigitNumber {
    return this > 99999 && this < 1000000;
  }

  bool get hasDoubleDigit {
    final s = this.toString();
    return s.contains("00") ||
        s.contains("11") ||
        s.contains("22") ||
        s.contains("33") ||
        s.contains("44") ||
        s.contains("55") ||
        s.contains("66") ||
        s.contains("77") ||
        s.contains("88") ||
        s.contains("99");
  }

  bool get neverDecreases {
    final chars = toString().chars;
    final windows = chars.kt.windowed(2).dart;
    final notDecreasing = windows.where((pair) {
      final first = pair[0].toInt();
      final second = pair[1].toInt();
      return first <= second;
    }).toList();
    return windows.length == notDecreasing.length;
  }
}
