extension DoubleToString on double {
  String doubleToString() {
    return toString().replaceAll('.', ',');
  }
}
