import 'package:aoc_common/aoc_common.dart';

int orbitCountChecksum(KtList<OrbitingRelationship> map) {
  return map.sumBy((it) => map.parentCount(it.orbiting));
}

extension MapExt on KtList<OrbitingRelationship> {
  int parentCount(AstronomicalObject o) {
    final parent = firstOrNull((it) => it.orbiting == o);
    if (parent == null) return 0;
    return 1 + parentCount(parent.center);
  }
}

int part2() {
  throw "TODO";
}

class OrbitingRelationship {
  OrbitingRelationship(this.center, this.orbiting);

  factory OrbitingRelationship.named(String center, String orbitingAround) {
    return OrbitingRelationship(
      AstronomicalObject(center),
      AstronomicalObject(orbitingAround),
    );
  }

  final AstronomicalObject center;
  final AstronomicalObject orbiting;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrbitingRelationship &&
          runtimeType == other.runtimeType &&
          center == other.center &&
          orbiting == other.orbiting;

  @override
  int get hashCode => center.hashCode ^ orbiting.hashCode;

  @override
  String toString() {
    return '$center)$orbiting';
  }
}

class AstronomicalObject {
  AstronomicalObject(this.name);

  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AstronomicalObject &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
