int fuel(int mass) {
  return ((mass / 3) - 2).roundDown();
}

extension DoubleExt on double {
  int roundDown() => (this - 0.5).round();
}
