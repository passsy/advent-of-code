import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day02/day02.dart';

void main(List<String> arguments) {
  final numbers = File('input.txt').readAsStringSync().split(',').map((it) => it.toInt()).toList().immutable();

  final program1 = numbers.toMutableList();
  program1[1] = 12;
  program1[2] = 2;
  final interpreter = Interpreter(program1);
  interpreter.run();
  print("Part 1 - ${interpreter.memoryDump[0]}");
}
