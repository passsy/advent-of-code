import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day07/day07.dart';
import 'package:trotter/trotter.dart';

void main(List<String> arguments) {
  final program = File('input.txt')
      .readAsStringSync()
      .split(',')
      .map((it) => it.toInt())
      .toList()
      .toImmutableList();

  final phases = listOf(0, 1, 2, 3, 4);
  final List<List<int>> combinations =
      Permutations(5, phases.dart).iterable.toList() as List<List<int>>;

  final signals = combinations.map((settings) {
    final amps = settings
        .map((it) => Amplifier(code: program, phase: it))
        .toList()
        .toImmutableList();
    final series = AmpSeries(amplifiers: amps);
    return series.signal();
  });

  final result = signals.max();

  print("Part 1 - $result");

  final phases2 = listOf(5, 6, 7, 8, 9);
  final List<List<int>> combinations2 =
      Permutations(5, phases2.dart).iterable.toList() as List<List<int>>;

  final signals2 = combinations2.map((settings) {
    final amps = settings
        .map((it) => Amplifier(code: program, phase: it))
        .toList()
        .toImmutableList();
    final series = AmpSeries(amplifiers: amps, loop: true);
    return series.signal();
  });

  final result2 = signals2.max();
  print("Part 2 - $result2");
}
