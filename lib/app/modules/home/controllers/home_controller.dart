import 'package:get/get.dart';
import 'package:macos_calculator/app/data/enums/operator.dart';

class HomeController extends GetxController {
  late RxList<String> equation;
  late RxString display;

  @override
  void onInit() {
    equation = <String>[].obs;
    display = "".obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateDisplay() {
    String displayText =
        equation.fold("", (previousValue, element) => "$previousValue$element");
    display.value = displayText;
  }

  void addDigit(String digit) {
    if (equation.isEmpty) {
      equation.add(digit);
    } else if (equation.last.isNum) {
      String updatedLastElement = equation.last + digit;
      equation.removeLast();
      equation.add(updatedLastElement);
    } else {
      equation.add(digit);
    }
    updateDisplay();
  }

  void addDecimal() {
    if (equation.isEmpty) {
      equation.add("0.");
    } else if (!equation.last.contains(".")) {
      String updatedLastElement = "${equation.last}.";
      equation.removeLast();
      equation.add(updatedLastElement);
    }
    updateDisplay();
  }

  void addOperator(String operator) {
    if (equation.isEmpty) {
      return;
    } else if (equation.last.isNum) {
      equation.add(operator);
    }
    updateDisplay();
  }

  void clear() {
    equation.clear();
    updateDisplay();
  }

  void invertSign() {
    if (equation.isEmpty) {
      return;
    } else if (equation.last.isNum) {
      String updatedLastElement = (double.parse(equation.last) * -1).toString();
      if (updatedLastElement.endsWith(".0")) {
        updatedLastElement =
            updatedLastElement.substring(0, updatedLastElement.length - 2);
      }
      equation.removeLast();
      equation.add(updatedLastElement);
    }
    updateDisplay();
  }

  void evaluate() {
    if (equation.isEmpty) {
      return;
    }
    if (!equation.last.isNum) {
      equation.removeLast();
    }
    _performOperation(Operator.modulus);
    _performOperation(Operator.divide);
    _performOperation(Operator.multiply);
    _performOperation(Operator.add);
    _performOperation(Operator.subtract);
    updateDisplay();
  }

  void _performOperation(Operator operator) {
    while (equation.contains(operator.value)) {
      int index = equation.indexOf(operator.value);
      double first = double.parse(equation[index - 1]);
      double second = double.parse(equation[index + 1]);
      double res = operator.operate(first, second).toPrecision(2);
      equation[index - 1] = res.toString();
      equation.removeAt(index + 1);
      equation.removeAt(index);
    }
  }
}
