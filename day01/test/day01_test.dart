import 'package:day01/day01.dart';
import 'package:test/test.dart';

void main() {
  group('fuel only', () {
    test('sample 1', () {
      expect(fuel(12), 2);
    });
    test('sample 2', () {
      expect(fuel(14), 2);
    });
    test('sample 3', () {
      expect(fuel(1969), 654);
    });
    test('sample 4', () {
      expect(fuel(100756), 33583);
    });

    test('no negative fuel', () {
      expect(fuel(0), 0);
      expect(fuel(-10), 0);
    });
  });

  group('fuel including fuel mass', () {
    test('sample 1', () {
      expect(recursiveFuel(14), 2);
    });
    test('sample 2', () {
      expect(recursiveFuel(1969), 966);
    });
    test('sample 3', () {
      expect(recursiveFuel(100756), 50346);
    });
  });
}
