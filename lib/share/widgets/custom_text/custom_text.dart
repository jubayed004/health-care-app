import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.color,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    final fontSizeValue = fontSize ?? 14;
    return Padding(
      padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(
        textAlign: textAlign,
        text.tr,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          fontSize: fontSizeValue,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
