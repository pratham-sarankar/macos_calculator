enum Operator {
  modulus,
  divide,
  multiply,
  add,
  subtract,
}

extension OperatorExtension on Operator {
  String get value {
    switch (this) {
      case Operator.modulus:
        return "%";
      case Operator.divide:
        return "÷";
      case Operator.multiply:
        return "×";
      case Operator.add:
        return "+";
      case Operator.subtract:
        return "-";
    }
  }

  double operate(double first, double second) {
    switch (this) {
      case Operator.modulus:
        return first % second;
      case Operator.divide:
        return first / second;
      case Operator.multiply:
        return first * second;
      case Operator.add:
        return first + second;
      case Operator.subtract:
        return first - second;
    }
  }
}
