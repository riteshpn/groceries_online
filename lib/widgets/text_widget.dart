import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLines = 10;

  TextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.textSize,
      this.isTitle = false,
      this.maxLines = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: textSize,
        fontWeight: isTitle ? FontWeight.w500 : FontWeight.normal,
        color: color,
      ),
    );
  }
}
