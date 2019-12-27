import 'package:aoc_common/aoc_common.dart';
import 'package:day06/day06.dart';
import 'package:test/test.dart';

void main() {
  group('part 1', () {
    test('sample 1', () {
      expect(orbitCountChecksum(sampleMap), 42);
    });
    test('sample 2', () {
      final me = AstronomicalObject("YOU");
      final santa = AstronomicalObject("SAN");

      final map = sampleMap
          .plusElement(OrbitingRelationship.named("K", me.name))
          .plusElement(OrbitingRelationship.named("I", santa.name));

      expect(orbitalTransfers(map, me, santa), 4);
    });
  });
}

final KtList<OrbitingRelationship> sampleMap = listFrom([
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
