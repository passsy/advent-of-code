import 'package:aoc_common/aoc_common.dart';
import 'package:day06/day06.dart';
import 'package:test/test.dart';

void main() {
  group('part 1', () {
    test('sample 1', () {
      final map = listFrom([
        OrbitingRelationship.named("COM", "B"),
        OrbitingRelationship.named("B", "C"),
        OrbitingRelationship.named("C", "D"),
        OrbitingRelationship.named("D", "E"),
        OrbitingRelationship.named("E", "F"),
        OrbitingRelationship.named("B", "G"),
        OrbitingRelationship.named("G", "H"),
        OrbitingRelationship.named("D", "I"),
        OrbitingRelationship.named("E", "J"),
        OrbitingRelationship.named("J", "K"),
        OrbitingRelationship.named("K", "L"),
      ]);
      expect(orbitCountChecksum(map), 42);
    });
    test('sample 2', () {
      expect(() => part2(), throwsA(isA<String>()));
    });
  });
}
