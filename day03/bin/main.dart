import 'dart:io';

import 'package:aoc_common/aoc_common.dart';
import 'package:day03/day03.dart';

void main(List<String> arguments) {
  final lines = File('input.txt').readAsStringSync().split('\n');
  final KtList<KtList<Vector>> cables =
      lines.map(parseCable).toList().immutable();

  final grid = Grid(cables);
  final closest = grid.closestIntersection();
  final distance = Offset.zero.distance(closest);
  print("Part 1 - $distance");
  print("Part 2 - ${grid.combinedFirstIntersectionDistance()}");
}

KtList<Vector> parseCable(String input) {
  return input.split(',').map(parseVector).toList().immutable();
}

Vector parseVector(String input) {
  final l = int.parse(input.substring(1));
  final d = parseDirection(input.chars.first);
  return Vector(direction: d, length: l);
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
