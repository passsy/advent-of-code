import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day05/interpreter.dart';

void main(List<String> arguments) {
  final program = File('input.txt').readAsStringSync().split(',').map((it) => it.toInt()).toList().toImmutableList();

  final interpreter = Interpreter(program)..run();
  interpreter.input(1);
  print("Part 1 - ${interpreter.output()}");

  final interpreter2 = Interpreter(program)..run();
  interpreter2.input(5);
  print("Part 2 - ${interpreter2.output()}");
}
