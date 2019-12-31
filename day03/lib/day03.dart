import 'package:aoc_common/aoc_common.dart';

class Grid {
  Grid(KtList<KtList<Vector>> cableVectors) {
    _placeCables(cableVectors);
  }

  final KtMutableMap<Offset, Map<Cable, int>> coordinates = KtHashMap.empty();

  void _placeCables(KtList<KtList<Vector>> cableVectors) {
    cableVectors.forEachIndexed((index, vectors) {
      final cable = Cable(index);
      var offset = Offset.zero;
      var distance = 0;
      for (final vector in vectors.iter) {
        for (final _ in 1.rangeTo(vector.length)) {
          distance++;
          offset = offset.moveInDirection(vector.direction);

          coordinates.putIfAbsent(offset, <Cable, int>{});
          final cables = coordinates[offset];
          cables[cable] = distance;
        }
      }
    });
  }

  Offset closestIntersection() => coordinates
      .filterValues((cables) => cables.length > 1)
      .minBy((entry) => entry.key.distance(Offset.zero))
      .key;

  int combinedFirstIntersectionDistance() => coordinates
      .filterValues((cables) => cables.length > 1)
      .map((it) => coordinates[it.key].values.sum())
      .min();
}

class Cable {
  Cable(this.index);

  final int index;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cable &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => index.hashCode;
}

class Vector {
  Vector({this.direction, this.length})
      : assert(direction != null),
        assert(length != null);

  final Direction direction;
  final int length;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vector &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          length == other.length;

  @override
  int get hashCode => direction.hashCode ^ length.hashCode;
}

enum Direction { left, up, right, down }

class Offset {
  const Offset({this.x, this.y})
      : assert(x != null),
        assert(y != null);

  static const Offset zero = Offset(x: 0, y: 0);

  final int x;
  final int y;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Offset &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

extension OffsetExt on Offset {
  Offset copyWith({int x, int y}) {
    return Offset(x: x ?? this.x, y: y ?? this.y);
  }

  Offset moveInDirection(Direction direction) {
    switch (direction) {
      case Direction.left:
        return copyWith(x: x - 1);
      case Direction.up:
        return copyWith(y: y + 1);
      case Direction.right:
        return copyWith(x: x + 1);
      case Direction.down:
        return copyWith(y: y - 1);
    }
    throw "unkown direction $direction";
  }

  int distance(Offset offset) {
    return (x - offset.x).abs() + (y - offset.y).abs();
  }
}
