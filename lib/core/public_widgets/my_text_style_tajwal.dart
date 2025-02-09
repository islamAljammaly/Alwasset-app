import 'package:flutter/material.dart';


class MyTextStyleTajwal extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const MyTextStyleTajwal(
      {required this.text,
      this.color = Colors.white,
      this.size = 16,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.textOverflow,

      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: getMyStyleTajwal(
        size: size,
        fontWeight : fontWeight,
        color : color,
      ),
      textAlign: textAlign,
    );
  }
}
TextStyle getMyStyleTajwal(
    {required FontWeight fontWeight, double? size, Color? color}) {
  return TextStyle(
    fontSize: size,
    fontWeight: fontWeight,
    color: color,
    fontFamily: 'Tajwal',
  );
}
