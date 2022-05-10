
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  String label;
  String? imagePath;
  Color? textColor;
  Color? backgroundColor;
  VoidCallback function;
  LoginButton({
    Key? key,
    required this.label,
    required this.function,
    this.imagePath,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
      ),
      onPressed: () => function(),
      icon: Image.asset(
        imagePath!,
        height: 25,
        width: 25,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
