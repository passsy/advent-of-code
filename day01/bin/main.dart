import 'dart:io';
import 'package:dartx/dartx.dart';

import 'package:day01/day01.dart';

void main(List<String> arguments) {
  final lines = File('input.txt').readAsStringSync().split('\n');

  final all = lines.map((it) {
    final mass = int.parse(it.trim());
    return fuel(mass);
  });

  print("Part 1 - ${all.sum()}");

  final all2 = lines.map((it) {
    final mass = int.parse(it.trim());
    return recursiveFuel(mass);
  });

  print("Part 2 - ${all2.sum()}");
}
