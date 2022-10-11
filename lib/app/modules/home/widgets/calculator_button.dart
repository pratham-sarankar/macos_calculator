import 'package:flutter/material.dart';
import 'package:macos_calculator/app/data/enums/button_type.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({
    Key? key,
    required this.buttonType,
    required this.text,
    this.flex = 1,
    required this.onTap,
    this.stateController,
  }) : super(key: key);
  final ButtonType buttonType;
  final String text;
  final int flex;
  final VoidCallback onTap;
  final MaterialStatesController? stateController;
  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Padding(
        padding: EdgeInsets.only(
            right: widget.buttonType != ButtonType.operator ? 1 : 0),
        child: TextButton(
          statesController: widget.stateController,
          style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(
              Size(0, double.infinity),
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return widget.buttonType.onPressedColor;
              }
              return widget.buttonType.bgColor;
            }),
            shape: const MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          ),
          onPressed: widget.onTap,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.buttonType.fontSize,
              fontWeight: FontWeight.w300,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
      ),
    );
  }
}
