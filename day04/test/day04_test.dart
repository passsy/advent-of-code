import 'package:day04/day04.dart';
import 'package:test/test.dart';

void main() {
  group("double", () {
    test("no double", () {
      expect(1234.hasDoubleDigit, isFalse);
      expect(0101010.hasDoubleDigit, isFalse);
    });
    test("double", () {
      expect(34323488.hasDoubleDigit, isTrue);
      expect(34348118.hasDoubleDigit, isTrue);
      expect(00343234.hasDoubleDigit, isFalse);
    });
  });
  group("sixdigits", () {
    test("has six", () {
      expect(1234.isSixDigitNumber, isFalse);
      expect(212121.isSixDigitNumber, isTrue);
    });
  });
  group("decreasing", () {
    test("isDecreasing", () {
      expect(985431.neverDecreases, isFalse);
      expect(1111111.neverDecreases, isTrue);
      expect(6789.neverDecreases, isTrue);
    });
  });
}
