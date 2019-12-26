import 'package:aoc_common/aoc_common.dart';
import 'package:dartx/dartx.dart';

class Interpreter {
  Interpreter(KtList<int> program) : _memory = program.toMutableList();
  final KtMutableList<int> _memory;

  KtList<int> get memoryDump => _memory.toList();

  int _pointer = 0;

  bool awaitingInput = false;

  int _input = null;

  int _output = null;

  bool finished = false;

  void run() {
    if (!_memory.contains(99)) {
      print("Warning, Intcode doesn't contain exit code 99. Make sure it is comuted at runtime");
    }
    while (!finished) {
      final op = _memory[_pointer];
      _execute(op);
      if (awaitingInput) {
        break;
      }
    }
  }

  void input(int input) {
    assert(awaitingInput == true);
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
    int param3() => modeP3 == 0 ? _memory[_relative(3)] : _relative(3);

    switch (op) {
      // add
      case 1:
        assert(modeP3 == 0);
        _memory[param3()] = param1() + param2();
        _pointer += 4;
        return;
      // multiply
      case 2:
        assert(modeP3 == 0);
        _memory[param3()] = param1() * param2();
        _pointer += 4;
        return;
      // wait for input
      case 3:
        if (awaitingInput) {
          assert(_input != null);
          awaitingInput = false;
          _memory[_relative(1)] = _input;
          _input = null;
          _pointer += 2;
        } else {
          awaitingInput = true;
        }
        return;
      // write output
      case 4:
        _output = _memory[_relative(1)];
        _pointer += 2;
        return;
      case 99:
        finished = true;
        return;
      default:
        throw "Unknown op code $opcode";
    }
  }

  int _relative(int offset) {
    return _memory[_pointer + offset];
  }
}
