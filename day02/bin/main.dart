import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day02/day02.dart';

void main(List<String> arguments) {
  final program = File('input.txt').readAsStringSync().split(',').map((it) => it.toInt()).toList().immutable();

  KtList<int> reproduceCrash(int noun, int verb) {
    final p = program.toMutableList();
    p[1] = noun;
    p[2] = verb;
    return p.toList();
  }

  final interpreter = Interpreter(reproduceCrash(12, 2))..run();
  print("Part 1 - ${interpreter.memoryDump[0]}");

  final nouns = 0.rangeTo(99);
  final verbs = 0.rangeTo(99);

  for (final noun in nouns) {
    for (final verb in verbs) {
      final interpreter = Interpreter(reproduceCrash(noun, verb))..run();
      final result = interpreter.memoryDump[0];
      if (result == 19690720) {
        print("Part 2 - ${100 * noun + verb} (noun=$noun verb=$verb)");
        return;
      }
    }
  }
  print("No solution found");
}
