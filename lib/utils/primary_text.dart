import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colour.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;// Optional override

  const PrimaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    // Default font is Inter
    final defaultStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.PrimaryText,
      ),
    );

    // If custom fontFamily provided, use that
    final customStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.PrimaryText,
    );

    return Text(
      text,
      style: fontFamily != null ? customStyle : defaultStyle,
      textAlign: textAlign ?? TextAlign.center, // ensure lines are centered
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

