import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day05/day05.dart';
import 'package:day05/interpreter.dart';

void main(List<String> arguments) {
  final program = File('input.txt').readAsStringSync().split(',').map((it) => it.toInt()).toList().toImmutableList();

  final interpreter = Interpreter(program)..run();
  interpreter.input(1);
  print("Part 1 - ${interpreter.output()}");

  print("Part 2 - ${part2()}");
}
