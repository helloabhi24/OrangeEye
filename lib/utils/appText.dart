import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final double? wordSpacing;
  final TextDecoration? textDecoration;
  const AppText(
      {this.textDecoration,
      this.wordSpacing,
      this.textAlign,
      this.fontStyle,
      this.fontWeight,
      this.fontSize,
      this.text = "",
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        decoration: textDecoration,
        letterSpacing: wordSpacing,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
      textAlign: textAlign,
    );
  }
}
