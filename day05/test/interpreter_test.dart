import 'package:aoc_common/aoc_common.dart';
import 'package:day05/interpreter.dart';
import 'package:test/test.dart';

void main() {
  group('instructions', () {
    test("1 - add two numbers", () {
      final interpreter = Interpreter(listFrom([1, 5, 6, 3, 99, 4, 5]));
      interpreter.run();
      expect(interpreter.memoryDump[3], 9);
    });
    test("2 - multiply two numbers", () {
      final interpreter = Interpreter(listFrom([2, 5, 6, 3, 99, 4, 5]));
      interpreter.run();
      expect(interpreter.memoryDump[3], 20);
    });
    test("3 - write int", () {
      final interpreter = Interpreter(listFrom([3, 3, 99, 0]));
      interpreter.run();
      interpreter.input(23);
      expect(interpreter.memoryDump[3], 23);
    });
    test("4 - read int", () {
      final interpreter = Interpreter(listFrom([4, 3, 99, 23]));
      interpreter.run();
      expect(interpreter.output(), 23);
    });
    test("5 - jump if true", () {
      final interpreter = Interpreter(listFrom([3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1]));
      interpreter.run();
      interpreter.input(0);
      expect(interpreter.output(), 0);
    });
    test("5 - jump not if false", () {
      final interpreter = Interpreter(listFrom([3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1]));
      interpreter.run();
      interpreter.input(12);
      expect(interpreter.output(), 1);
    });
    test("6 - jump if false", () {
      final interpreter = Interpreter(listFrom([3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9]));
      interpreter.run();
      interpreter.input(0);
      expect(interpreter.output(), 0);
    });
    test("6 - jump not if true", () {
      final interpreter = Interpreter(listFrom([3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9]));
      interpreter.run();
      interpreter.input(12);
      expect(interpreter.output(), 1);
    });
    group("7 - less than", () {
      test("position mode less than 8", () {
        final interpreter = Interpreter(listFrom([3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8]));
        interpreter.run();
        interpreter.input(7);
        expect(interpreter.output(), 1);
      });
      test("position mode equal 8", () {
        final interpreter = Interpreter(listFrom([3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8]));
        interpreter.run();
        interpreter.input(8);
        expect(interpreter.output(), 0);
      });
      test("position mode larger 8", () {
        final interpreter = Interpreter(listFrom([3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8]));
        interpreter.run();
        interpreter.input(9);
        expect(interpreter.output(), 0);
      });
      test("immediate mode less than 8", () {
        final interpreter = Interpreter(listFrom([3, 3, 1107, -1, 8, 3, 4, 3, 99]));
        interpreter.run();
        interpreter.input(7);
        expect(interpreter.output(), 1);
      });
      test("immediate mode equal 8", () {
        final interpreter = Interpreter(listFrom([3, 3, 1107, -1, 8, 3, 4, 3, 99]));
        interpreter.run();
        interpreter.input(8);
        expect(interpreter.output(), 0);
      });
      test("immediate mode larger 8", () {
        final interpreter = Interpreter(listFrom([3, 3, 1107, -1, 8, 3, 4, 3, 99]));
        interpreter.run();
        interpreter.input(9);
        expect(interpreter.output(), 0);
      });
    });
    group("8 - equals", () {
      test("position mode equals 8", () {
        final interpreter = Interpreter(listFrom([3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8]));
        interpreter.run();
        interpreter.input(8);
        expect(interpreter.output(), 1);
      });
      test("position mode not equal 8", () {
        final interpreter = Interpreter(listFrom([3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8]));
        interpreter.run();
        interpreter.input(1);
        expect(interpreter.output(), 0);
      });
      test("immediate mode equals 8", () {
        final interpreter = Interpreter(listFrom([3, 3, 1108, -1, 8, 3, 4, 3, 99]));
        interpreter.run();
        interpreter.input(8);
        expect(interpreter.output(), 1);
      });
      test("immediate mode not equal 8", () {
        final interpreter = Interpreter(listFrom([3, 3, 1108, -1, 8, 3, 4, 3, 99]));
        interpreter.run();
        interpreter.input(1);
        expect(interpreter.output(), 0);
      });
    });
    test("99 - exit", () {
      final interpreter = Interpreter(listFrom([99]));
      interpreter.run();
      expect(interpreter.memoryDump[0], 99);
    });
  });

  test("echo", () {
    final interpreter = Interpreter(listFrom([3, 0, 4, 0, 99]));
    interpreter.run();
    interpreter.input(9);
    expect(interpreter.output(), 9);
  });

  test("negateive values", () {
    final interpreter = Interpreter(listFrom([1101, 100, -1, 4, 0]));
    interpreter.run();
    expect(interpreter.memoryDump[4], 99);
  });
  test("large example 1", () {
    final interpreter = Interpreter(largeProgram);
    interpreter.run();
    interpreter.input(7);
    expect(interpreter.output(), 999);
  });
  test("large example 2", () {
    final interpreter = Interpreter(largeProgram);
    interpreter.run();
    interpreter.input(8);
    expect(interpreter.output(), 1000);
  });
  test("large example 3", () {
    final interpreter = Interpreter(largeProgram);
    interpreter.run();
    interpreter.input(9);
    expect(interpreter.output(), 1001);
  });
}

final KtList<int> largeProgram = listFrom([
  3,
  21,
  1008,
  21,
  8,
  20,
  1005,
  20,
  22,
  107,
  8,
  21,
  20,
  1006,
  20,
  31,
  1106,
  0,
  36,
  98,
  0,
  0,
  1002,
  21,
  125,
  20,
  4,
  20,
  1105,
  1,
  46,
  104,
  999,
  1105,
  1,
  46,
  1101,
  1000,
  1,
  20,
  4,
  20,
  1105,
  1,
  46,
  98,
  99
]);
