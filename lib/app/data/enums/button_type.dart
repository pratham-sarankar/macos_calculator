import 'package:flutter/material.dart';

enum ButtonType {
  digit,
  decimal,
  operator,
  evaluate,
  allClear,
  invert,
  modulo,
}

extension ButtonTypeExtension on ButtonType {
  Color get bgColor {
    switch (this) {
      case ButtonType.digit:
        return Colors.white.withOpacity(0.28);
      case ButtonType.decimal:
        return Colors.white.withOpacity(0.28);
      case ButtonType.operator:
        return const Color(0xffff9e0b);
      case ButtonType.evaluate:
        return const Color(0xffff9e0b);
      case ButtonType.allClear:
        return Colors.white.withOpacity(0.14);
      case ButtonType.invert:
        return Colors.white.withOpacity(0.14);
      case ButtonType.modulo:
        return Colors.white.withOpacity(0.14);
    }
  }

  Color get onPressedColor {
    switch (this) {
      case ButtonType.digit:
        return Colors.white.withOpacity(0.5);
      case ButtonType.decimal:
        return Colors.white.withOpacity(0.5);
      case ButtonType.operator:
        return const Color(0xffe08f17);
      case ButtonType.evaluate:
        return const Color(0xffe08f17);
      case ButtonType.allClear:
        return Colors.white.withOpacity(0.28);
      case ButtonType.invert:
        return Colors.white.withOpacity(0.28);
      case ButtonType.modulo:
        return Colors.white.withOpacity(0.28);
    }
  }

  double get fontSize {
    switch (this) {
      case ButtonType.digit:
        return 22;
      case ButtonType.decimal:
        return 22;
      case ButtonType.operator:
        return 25;
      case ButtonType.evaluate:
        return 25;
      case ButtonType.allClear:
        return 18;
      case ButtonType.invert:
        return 18;
      case ButtonType.modulo:
        return 18;
    }
  }
}
