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
    final series = AmpSeries(settings
        .map((it) => Amplifier(code: program, phase: it))
        .toList()
        .toImmutableList());
    return series.signal();
  });

  final result = signals.max();

  print("Part 1 - $result");
  print("Part 2 - ${part2()}");
}
