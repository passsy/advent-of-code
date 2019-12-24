import 'package:dartx/dartx.dart';
import 'package:day04/day04.dart';

void main(List<String> arguments) {
  List<int> possiblePasswords(int start, int end) {
    return start
        .rangeTo(end)
        .filter((it) => it.isSixDigitNumber)
        .filter((it) => it.hasDoubleDigit)
        .filter((it) => it.neverDecreases)
        .toList();
  }

  final passwords = possiblePasswords(387638, 919123);
  print("Part 1 - ${passwords.length}");

  List<int> possiblePasswords2(int start, int end) {
    return start
        .rangeTo(end)
        .filter((it) => it.isSixDigitNumber)
        .filter((it) => it.hasDoubleDigitButNoTriple)
        .filter((it) => it.neverDecreases)
        .toList();
  }

  final passwords2 = possiblePasswords2(387638, 919123);
  print("Part 1 - ${passwords2.length}");
}
