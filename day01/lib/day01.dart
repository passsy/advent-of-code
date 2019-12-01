int fuel(int mass) {
  final fuel = ((mass / 3) - 2).roundDown();
  if (fuel < 0) return 0;
  return fuel;
}

int recursiveFuel(int mass) {
  int result = fuel(mass);
  int added = result;
  while (true) {
    added = fuel(added);
    if (added == 0) break;
    result += added;
  }
  return result;
}

extension DoubleExt on double {
  int roundDown() => (this - 0.5).round();
}
