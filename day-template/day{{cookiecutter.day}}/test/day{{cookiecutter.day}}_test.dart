import 'package:day{{cookiecutter.day}}/day{{cookiecutter.day}}.dart';
import 'package:test/test.dart';

void main() {
  group('part 1', () {
    test('sample 1', () {
      expect(() => part1(), throwsA(isA<String>()));
    });
    test('sample 2', () {
      expect(() => part2(), throwsA(isA<String>()));
    });
  });
}
