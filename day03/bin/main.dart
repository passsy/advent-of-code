import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day03/day03.dart';

void main(List<String> arguments) {
  final lines = File('input.txt').readAsStringSync().split('\n');

  final KtList<KtList<Vector>> cables = lines
      .map((it) {
        return it
            .split(',')
            .map((it) {
              return Vector(
                direction: parseDirection(it.chars.first),
                length: int.parse(it.substring(1)),
              );
            })
            .toList()
            .immutable();
      })
      .toList()
      .immutable();

  final grid = Grid(cables);
  final origin = Offset.zero;
  final closest = grid.closestIntersection(origin);
  final distance = origin.distance(closest);
  print("Part 1 - $distance");
}

Direction parseDirection(String input) {
  switch (input) {
    case "L":
      return Direction.left;
    case "U":
      return Direction.up;
    case "R":
      return Direction.right;
    case "D":
      return Direction.down;
  }
  throw "unkown direction";
}
