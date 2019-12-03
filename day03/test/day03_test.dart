import 'package:aoc_common/aoc_common.dart';
import 'package:day03/day03.dart';
import 'package:test/test.dart';

void main() {
  group('sample1', () {
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
    test("closest intersection", () {
      final closestIntersection = grid.closestIntersection();
      expect(closestIntersection, const Offset(x: 3, y: 3));
      expect(closestIntersection.distance(Offset.zero), 6);
    });
    test("shortest path", () {
      final minSteps = grid.combinedFirstIntersectionDistance();
      expect(minSteps, 30);
    });
  });

  group("sample 2", () {
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
    test("closest intersection", () {
      final closestIntersection = grid.closestIntersection();
      expect(closestIntersection.distance(Offset.zero), 159);
    });

    test("shortest path", () {
      final minSteps = grid.combinedFirstIntersectionDistance();
      expect(minSteps, 610);
    });
  });

  group("sample 3", () {
    final grid = Grid(listOf(
      listFrom([
        Vector(direction: Direction.right, length: 98),
        Vector(direction: Direction.up, length: 47),
        Vector(direction: Direction.right, length: 26),
        Vector(direction: Direction.down, length: 63),
        Vector(direction: Direction.right, length: 33),
        Vector(direction: Direction.up, length: 87),
        Vector(direction: Direction.left, length: 62),
        Vector(direction: Direction.down, length: 20),
        Vector(direction: Direction.right, length: 33),
        Vector(direction: Direction.up, length: 53),
        Vector(direction: Direction.right, length: 51),
      ]),
      listOf(
        Vector(direction: Direction.up, length: 98),
        Vector(direction: Direction.right, length: 91),
        Vector(direction: Direction.down, length: 20),
        Vector(direction: Direction.right, length: 16),
        Vector(direction: Direction.down, length: 67),
        Vector(direction: Direction.right, length: 40),
        Vector(direction: Direction.up, length: 7),
        Vector(direction: Direction.right, length: 15),
        Vector(direction: Direction.up, length: 6),
        Vector(direction: Direction.right, length: 7),
      ),
    ));
    test("closest intersection", () {
      final closestIntersection = grid.closestIntersection();
      expect(closestIntersection.distance(Offset.zero), 135);
    });

    test("shortest path", () {
      final minSteps = grid.combinedFirstIntersectionDistance();
      expect(minSteps, 410);
    });
  });
}
