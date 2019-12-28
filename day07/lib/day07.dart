import 'package:aoc_common/aoc_common.dart';
import 'package:day07/interpreter.dart';
import 'package:kt_dart/kt.dart';

int part1() {
  throw "TODO";
}

int part2() {
  throw "TODO";
}

class Amplifier {
  Amplifier({
    KtList<int> code,
    this.phase,
  }) : _interpreter = Interpreter(code);

  final int phase;
  final Interpreter _interpreter;

  bool get finished => _interpreter.finished;

  void init() {
    _interpreter.run();
    _interpreter.input(phase);
  }

  int input(int input) {
    _interpreter.input(input);
    return _interpreter.output();
  }
}

class AmpSeries {
  const AmpSeries({
    this.amplifiers,
    this.loop = false,
  });

  final KtList<Amplifier> amplifiers;
  final bool loop;

  int signal() {
    int lastSignal = 0;
    amplifiers.forEach((it) => it.init());
    while (!amplifiers.last().finished) {
      for (final a in amplifiers.iter) {
        lastSignal = a.input(lastSignal);
      }
      if (!loop) break;
    }
    return lastSignal;
  }
}
