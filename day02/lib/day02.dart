import 'package:aoc_common/aoc_common.dart';

class Interpreter {
  Interpreter(KtList<int> program) : _memory = program.toMutableList();
  final KtMutableList<int> _memory;

  KtList<int> get memoryDump => _memory.toList();

  int _pointer = 0;

  void run() {
    if (!_memory.contains(99)) {
      print("Warning, Intcode doesn't contain exit code 99. Make sure it is comuted at runtime");
    }
    while (!finished) {
      final op = _memory[_pointer];
      _execute(op);
      _pointer += 4;
    }
  }

  bool finished = false;

  void _execute(int opcode) {
    switch (opcode) {
      case 1:
        _memory[_relative(3)] = _memory[_relative(1)] + _memory[_relative(2)];
        return;
      case 2:
        _memory[_relative(3)] = _memory[_relative(1)] * _memory[_relative(2)];
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
