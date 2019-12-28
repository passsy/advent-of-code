import 'package:aoc_common/aoc_common.dart';
import 'package:dartx/dartx.dart';

const bool debug = false;

class Interpreter {
  Interpreter(KtList<int> program) : _memory = program.toMutableList();
  final KtMutableList<int> _memory;

  KtList<int> get memoryDump => _memory.toList();

  int _pointer = 0;

  bool awaitingInput = false;

  int _input;

  int _output;

  bool _finished = false;

  void run() {
    if (!_memory.contains(99)) {
      print(
          "Warning, Intcode doesn't contain exit code 99. Make sure it is comuted at runtime");
    }
    while (!_finished) {
      final op = _memory[_pointer];
      _execute(op);
      if (awaitingInput) {
        break;
      }
    }
  }

  void input(int input) {
    assert(awaitingInput == true);
    assert(_input == null);
    if (debug) print("Received input $input");
    _input = input;
    run();
  }

  int output() {
    return _output;
  }

  void _execute(int opcode) {
    final op = opcode.remainder(100).toInt();
    final chars = opcode.toString().reversed.chars.toList().kt;
    // mode 0 = position mode
    // mode 1 = immediate mode
    final modeP1 = chars.getOrNull(2)?.toIntOrNull() ?? 0;
    final modeP2 = chars.getOrNull(3)?.toIntOrNull() ?? 0;
    final modeP3 = chars.getOrNull(4)?.toIntOrNull() ?? 0;

    /// params depending on mode
    int param1() => modeP1 == 0 ? _memory[_relative(1)] : _relative(1);
    int param2() => modeP2 == 0 ? _memory[_relative(2)] : _relative(2);
    // ignore: unused_element
    int param3() => modeP3 == 0 ? _memory[_relative(3)] : _relative(3);

    switch (op) {
      // add
      case 1:
        assert(modeP3 == 0);
        if (debug) print("(1) &${_relative(3)} = ${param1()} + ${param2()}");
        _memory[_relative(3)] = param1() + param2();
        _pointer += 4;
        return;
      // multiply
      case 2:
        assert(modeP3 == 0);
        if (debug) print("(2) \$${_relative(3)} = ${param1()} * ${param2()}");
        _memory[_relative(3)] = param1() * param2();
        _pointer += 4;
        return;
      // wait for input
      case 3:
        if (awaitingInput) {
          assert(_input != null);
          awaitingInput = false;
          _memory[_relative(1)] = _input;
          if (debug) print("(3) Writing input $_input to &${_relative(1)}");
          _input = null;
          _pointer += 2;
        } else {
          if (debug) print("(3) waiting for input");
          awaitingInput = true;
        }
        return;
      // write output
      case 4:
        if (modeP1 == 1) {
          _output = _relative(1);
        } else {
          _output = _memory[_relative(1)];
        }
        if (debug) print("(4) Output: $_output");
        _pointer += 2;
        return;
      // jump if true
      case 5:
        if (param1() != 0) {
          _pointer = param2();
          if (debug) print("(5) Jump to: $_pointer");
        } else {
          _pointer += 3;
          if (debug) print("(5) Do not Jump ${param1()} != 0");
        }
        return;
      // jump if false
      case 6:
        if (param1() == 0) {
          _pointer = param2();
          if (debug) print("(6) Jump to: $_pointer");
        } else {
          _pointer += 3;
          if (debug) print("(6) Do not Jump ${param1()} == 0");
        }
        return;
      // less than
      case 7:
        final smaller = param1() < param2();
        if (debug) {
          if (smaller) {
            print("(7) ${param1()} < ${param2()}, write 1 to &${_relative(3)}");
          } else {
            print(
                "(7) ${param1()} < ${param2()} (NOT), write 0 to &${_relative(3)}");
          }
        }
        _memory[_relative(3)] = smaller ? 1 : 0;
        _pointer += 4;
        return;
      // equals
      case 8:
        final equal = param1() == param2();
        if (debug) {
          if (equal) {
            print(
                "(7) ${param1()} == ${param2()}, write 1 to &${_relative(3)}");
          } else {
            print(
                "(7) ${param1()} != ${param2()}, write 0 to &${_relative(3)}");
          }
        }
        _memory[_relative(3)] = equal ? 1 : 0;
        _pointer += 4;
        return;
      // halt program
      case 99:
        if (debug) print("(99) HALT");
        _finished = true;
        return;
      default:
        throw "Unknown op code $opcode";
    }
  }

  int _relative(int offset) {
    return _memory[_pointer + offset];
  }
}
