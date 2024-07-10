import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText.headingSmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTextStyles.headingSmall;

  AppText.paragraph(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTextStyles.paragraph;

  AppText.description(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTextStyles.description;

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final appliedStyle = TextStyle(
      color: color ?? context.appColors.foregroundPrimary,
    ).merge(style);

    return Text(
      text,
      style: appliedStyle,
      textAlign: textAlign,
    );
  }
}
