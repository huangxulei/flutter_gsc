import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() async {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
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

final buttonColors = WindowButtonColors(
    iconNormal: Colors.black,
    mouseOver: const Color.fromARGB(255, 224, 224, 224),
    mouseDown: const Color.fromARGB(255, 202, 202, 202),
    iconMouseOver: Colors.black,
    iconMouseDown: Colors.black);

final closeButtonColors = WindowButtonColors(
    mouseOver: Colors.red,
    mouseDown: const Color.fromARGB(255, 206, 54, 43),
    iconNormal: Colors.black,
    iconMouseOver: Colors.black);
