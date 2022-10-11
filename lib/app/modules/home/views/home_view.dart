import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos_calculator/app/data/enums/button_type.dart';
import 'package:macos_calculator/app/modules/home/widgets/calculator_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          WindowTitleBarBox(
            child: MoveWindow(),
          ),
          SizedBox(
            height: 60,
            child: MoveWindow(
              onDoubleTap: () {},
              child: Container(
                padding: const EdgeInsets.only(bottom: 5, right: 5),
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  child: Obx(
                    () => Text(
                      controller.display.string.isEmpty
                          ? "0"
                          : controller.display.string,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        CalculatorButton(
                          buttonType: ButtonType.allClear,
                          text: "AC",
                          onTap: () {
                            controller.clear();
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.invert,
                          text: "+/-",
                          onTap: () {
                            controller.invertSign();
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.modulo,
                          text: "%",
                          onTap: () {
                            controller.addOperator("%");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.operator,
                          text: "÷",
                          onTap: () {
                            controller.addOperator("÷");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "7",
                          onTap: () {
                            controller.addDigit("7");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "8",
                          onTap: () {
                            controller.addDigit("8");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "9",
                          onTap: () {
                            controller.addDigit("9");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.operator,
                          text: "×",
                          onTap: () {
                            controller.addOperator("×");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "4",
                          onTap: () {
                            controller.addDigit("4");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "5",
                          onTap: () {
                            controller.addDigit("5");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "6",
                          onTap: () {
                            controller.addDigit("6");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.operator,
                          text: "-",
                          onTap: () {
                            controller.addOperator("-");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "1",
                          onTap: () {
                            controller.addDigit("1");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "2",
                          onTap: () {
                            controller.addDigit("2");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: "3",
                          onTap: () {
                            controller.addDigit("3");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.operator,
                          text: "+",
                          onTap: () {
                            controller.addOperator("+");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        CalculatorButton(
                          flex: 2,
                          buttonType: ButtonType.digit,
                          text: "0",
                          onTap: () {
                            controller.addDigit("0");
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.digit,
                          text: ".",
                          onTap: () {
                            controller.addDecimal();
                          },
                        ),
                        CalculatorButton(
                          buttonType: ButtonType.operator,
                          text: "=",
                          onTap: () {
                            controller.evaluate();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
