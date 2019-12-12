import 'package:seven_segment_display/seven_segment_display.dart';
import 'package:test/test.dart';

void main() {
  group('seven segment', () {
    test("can't show negative numbers", () {
      expect(() => SevenSegmentPanel(-1), throwsA(isA<RangeError>()));
    });
    test("can't show numbers larger than 9 numbers", () {
      expect(() => SevenSegmentPanel(10), throwsA(isA<RangeError>()));
    });
    test("shows numbers 0-9", () {
      expect(SevenSegmentPanel(0), isNotNull);
      expect(SevenSegmentPanel(1), isNotNull);
      expect(SevenSegmentPanel(2), isNotNull);
      expect(SevenSegmentPanel(3), isNotNull);
      expect(SevenSegmentPanel(4), isNotNull);
      expect(SevenSegmentPanel(5), isNotNull);
      expect(SevenSegmentPanel(6), isNotNull);
      expect(SevenSegmentPanel(7), isNotNull);
      expect(SevenSegmentPanel(8), isNotNull);
      expect(SevenSegmentPanel(9), isNotNull);
    });
  });

  group("turns on correct segment", () {
    test("0", () {
      final panel = SevenSegmentPanel(0);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n| |\n|_|");
    });
    test("1", () {
      final panel = SevenSegmentPanel(1);
      final output = displaySingleInConsole(panel);
      expect(output, "   \n  |\n  |");
    });
    test("2", () {
      final panel = SevenSegmentPanel(2);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n _|\n|_ ");
    });
    test("3", () {
      final panel = SevenSegmentPanel(3);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n _|\n _|");
    });
    test("4", () {
      final panel = SevenSegmentPanel(4);
      final output = displaySingleInConsole(panel);
      expect(output, "   \n|_|\n  |");
    });
    test("5", () {
      final panel = SevenSegmentPanel(5);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n|_ \n _|");
    });
    test("6", () {
      final panel = SevenSegmentPanel(6);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n|_ \n|_|");
    });
    test("7", () {
      final panel = SevenSegmentPanel(7);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n  |\n  |");
    });
    test("8", () {
      final panel = SevenSegmentPanel(8);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n|_|\n|_|");
    });
    test("9", () {
      final panel = SevenSegmentPanel(9);
      final output = displaySingleInConsole(panel);
      expect(output, " _ \n|_|\n _|");
    });
  });

  group("print multiple chars", () {
    test("0123456789", () {
      final chars = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((it) => SevenSegmentPanel(it)).toList();
      final console = displayInConsole(chars);
      print(console);
      expect(
          console, " _     _  _     _  _  _  _  _ \n| |  | _| _||_||_ |_   ||_||_|\n|_|  ||_  _|  | _||_|  ||_| _|\n");
    });
    test("Rosi 32168", () {
      final chars = [3, 2, 1, 6, 8].map((it) => SevenSegmentPanel(it)).toList();
      final console = displayInConsole(chars);
      print(console);
      expect(console, " _  _     _  _ \n _| _|  ||_ |_|\n _||_   ||_||_|\n");
    });
  });
}
