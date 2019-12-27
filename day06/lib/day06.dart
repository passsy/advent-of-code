import 'package:aoc_common/aoc_common.dart';

int orbitCountChecksum(KtList<OrbitingRelationship> map) {
  return map.sumBy((it) => map.parentCount(it.orbiting));
}

int orbitalTransfers(KtList<OrbitingRelationship> map, AstronomicalObject from,
    AstronomicalObject to) {
  final parentsFrom = map.parents(from);
  final parentsTo = map.parents(to);
  final union = parentsFrom.union(parentsTo);
  final intersection = parentsFrom.intersect(parentsTo);
  final complement = union - intersection;
  return complement.size;
}

extension _MapExt on KtList<OrbitingRelationship> {
  int parentCount(AstronomicalObject o) => parents(o).size;

  KtList<AstronomicalObject> parents(AstronomicalObject o) {
    final parent = firstOrNull((it) => it.orbiting == o);
    if (parent == null) return emptyList();
    return parents(parent.center).plusElement(parent.center);
  }
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

  @override
  String toString() {
    return name;
  }
}
