import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  ButtonPage({
    super.key,
    required this.text,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      color: Color(0xFFb57edc),
      child: Text(text),
    );
  }
}
