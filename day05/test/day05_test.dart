import 'package:aoc_common/aoc_common.dart';
import 'package:day05/interpreter.dart';
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
    test("3 - write int", () {
      final interpreter = Interpreter(mutableListFrom([3, 3, 99, 0]));
      interpreter.run();
      interpreter.input(23);
      expect(interpreter.memoryDump[3], 23);
    });
    test("4 - read int", () {
      final interpreter = Interpreter(mutableListFrom([4, 3, 99, 23]));
      interpreter.run();
      expect(interpreter.output(), 23);
    });
    test("99 - exit", () {
      final interpreter = Interpreter(mutableListFrom([99]));
      interpreter.run();
      expect(interpreter.memoryDump[0], 99);
    });
  });

  test("echo", () {
    final interpreter = Interpreter(mutableListFrom([3, 0, 4, 0, 99]));
    interpreter.run();
    interpreter.input(9);
    expect(interpreter.output(), 9);
  });

  test("negateive values", () {
    final interpreter = Interpreter(mutableListFrom([1101, 100, -1, 4, 0]));
    interpreter.run();
    expect(interpreter.memoryDump[4], 99);
  });
}
