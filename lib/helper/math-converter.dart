class MathConverter {
  static int intToHundred(int value) {
    int a = value % 100;
    if (a > 0) {
      return (value ~/ 100) * 100 + 100;
    }
    return value;
  }
}
