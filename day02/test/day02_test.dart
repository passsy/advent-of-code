import 'package:aoc_common/aoc_common.dart';
import 'package:day02/day02.dart';
import 'package:test/test.dart';

void main() {
  group('instructions', () {
    test("1 - add two numbers", () {
      final interpreter = Interpreter(mutableListFrom([1, 5, 6, 3, 99, 4, 5]));
      interpreter.run();
      expect(interpreter.memoryDump[3], 9);
    });
    test("2 - multiply two numbers", () {
      final interpreter = Interpreter(mutableListFrom([2, 5, 6, 3, 99, 4, 5]));
      interpreter.run();
      expect(interpreter.memoryDump[3], 20);
    });
    test("99 - exit", () {
      final interpreter = Interpreter(mutableListFrom([99]));
      interpreter.run();
      expect(interpreter.memoryDump[0], 99);
    });
  });
}
