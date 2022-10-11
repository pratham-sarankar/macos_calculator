import 'package:bitsdojo_window/bitsdojo_window.dart';
import "package:flutter/material.dart";

final buttonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: Colors.grey.withOpacity(0.2),
);

final closeButtonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFD32F2F),
);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key, this.resizable = true}) : super(key: key);
  final bool resizable;
  @override
  WindowButtonsState createState() => WindowButtonsState();
}

class WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        if (widget.resizable)
          appWindow.isMaximized
              ? RestoreWindowButton(
                  colors: buttonColors,
                  onPressed: maximizeOrRestore,
                )
              : MaximizeWindowButton(
                  colors: buttonColors,
                  onPressed: maximizeOrRestore,
                ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
