import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day06/day06.dart';

void main(List<String> arguments) {
  final map = File('input.txt')
      .readAsStringSync()
      .split('\n')
      .map((it) {
        final split = it.split(")");
        return OrbitingRelationship.named(split[0], split[1]);
      })
      .toList()
      .toImmutableList();

  print("Part 1 - ${orbitCountChecksum(map)}");
  print("Part 2 - ${part2()}");
}
