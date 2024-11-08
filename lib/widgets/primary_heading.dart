import 'package:flutter/material.dart';

class PrimaryHeading extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  PrimaryHeading({required this.text, this.fontSize = 20.0, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
    );
  }
}
