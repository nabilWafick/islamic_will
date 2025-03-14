import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? textOverflow;
  final TextStyle? style;

  const AppText(
    this.text, {
    super.key,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textOverflow,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: 10,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontFamily: 'Poppins',
            fontWeight: fontWeight,
            color: color,
          ),
    );
  }
}
