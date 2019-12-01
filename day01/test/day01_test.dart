import 'package:day01/day01.dart';
import 'package:test/test.dart';

void main() {
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
}
