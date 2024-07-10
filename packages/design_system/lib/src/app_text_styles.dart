import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle headingSmall = GoogleFonts.rubik(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 24 / 20,
  );

  static final TextStyle lgHeadingSmall = GoogleFonts.rubik(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 28.8 / 24,
  );

  static final TextStyle subtitle = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 27 / 18,
  );

  static final TextStyle subtitleLg = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 24 / 20,
  );

  static final TextStyle paragraph = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 21 / 14,
  );

  static final TextStyle description = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 18 / 12,
  );

  static final TextStyle button = GoogleFonts.workSans(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 16 / 16,
  );
}
