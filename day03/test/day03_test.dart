import 'package:aoc_common/aoc_common.dart';
import 'package:day03/day03.dart';
import 'package:test/test.dart';

void main() {
  test("sample 1", () {
    final grid = Grid(listOf(
      listOf(
        Vector(direction: Direction.right, length: 8),
        Vector(direction: Direction.up, length: 5),
        Vector(direction: Direction.left, length: 5),
        Vector(direction: Direction.down, length: 3),
      ),
      listOf(
        Vector(direction: Direction.up, length: 7),
        Vector(direction: Direction.right, length: 6),
        Vector(direction: Direction.down, length: 4),
        Vector(direction: Direction.left, length: 4),
      ),
    ));
    final closestIntersection = grid.closestIntersection(Offset.zero);
    expect(closestIntersection, const Offset(x: 3, y: 3));
    expect(closestIntersection.distance(Offset.zero), 6);
  });

  test("sample 2", () {
    final grid = Grid(listOf(
      listOf(
        Vector(direction: Direction.right, length: 75),
        Vector(direction: Direction.down, length: 30),
        Vector(direction: Direction.right, length: 83),
        Vector(direction: Direction.up, length: 83),
        Vector(direction: Direction.left, length: 12),
        Vector(direction: Direction.down, length: 49),
        Vector(direction: Direction.right, length: 71),
        Vector(direction: Direction.up, length: 7),
        Vector(direction: Direction.left, length: 72),
      ),
      listOf(
        Vector(direction: Direction.up, length: 62),
        Vector(direction: Direction.right, length: 66),
        Vector(direction: Direction.up, length: 55),
        Vector(direction: Direction.right, length: 34),
        Vector(direction: Direction.down, length: 71),
        Vector(direction: Direction.right, length: 55),
        Vector(direction: Direction.down, length: 58),
        Vector(direction: Direction.right, length: 58),
      ),
    ));
    final closestIntersection = grid.closestIntersection(Offset.zero);
    expect(closestIntersection.distance(Offset.zero), 159);
  });
}
