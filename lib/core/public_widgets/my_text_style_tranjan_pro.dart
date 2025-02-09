import 'package:flutter/material.dart';

class MyTextStyleTrajanPro extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final List<Shadow>? shadow;

  const MyTextStyleTrajanPro(
      {required this.text,
      this.color = Colors.white,
      this.size = 16,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.textOverflow,
      this.shadow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: getMyStyleTrajanPro(
        size: size,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

TextStyle getMyStyleTrajanPro(
    {required FontWeight fontWeight,
    double? size,
    Color? color,
    List<Shadow>? shadow}) {
  return TextStyle(
    fontSize: size,
    fontWeight: fontWeight,
    color: color,
    fontFamily: 'Trajan Pro',
    shadows: shadow,
  );
}
