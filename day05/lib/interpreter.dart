import 'package:aoc_common/aoc_common.dart';

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
    switch (opcode) {
      case 1:
        _memory[_relative(3)] = _memory[_relative(1)] + _memory[_relative(2)];
        _pointer += 4;
        return;
      case 2:
        _memory[_relative(3)] = _memory[_relative(1)] * _memory[_relative(2)];
        _pointer += 4;
        return;
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
      case 4:
        final address = _relative(1);
        _output = _memory[address];
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
