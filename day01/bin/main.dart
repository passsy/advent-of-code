import 'dart:io';

import 'package:day01/day01.dart';
import 'package:dartx/dartx.dart';

void main(List<String> arguments) {
  final lines = File('input.txt').readAsStringSync().split('\n');
  final masses = lines.map((it) => int.parse(it.trim()));

  print("Part 1 - ${masses.map((it) => fuel(it)).sum()}");
  print("Part 2 - ${masses.map((it) => recursiveFuel(it)).sum()}");
}
