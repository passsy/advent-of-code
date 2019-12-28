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

  int run(int input) {
    _interpreter.run();
    _interpreter.input(phase);
    _interpreter.input(input);
    return _interpreter.output();
  }
}

class AmpSeries {
  AmpSeries(this.amplifiers);

  final KtList<Amplifier> amplifiers;

  int signal() {
    int lastSignal = 0;
    for (final a in amplifiers.iter) {
      lastSignal = a.run(lastSignal);
    }
    return lastSignal;
  }
}
