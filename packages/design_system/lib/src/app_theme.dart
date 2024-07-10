import 'package:design_system/src/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const AppColors().backgroundPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: const AppColors().backgroundPrimary,
      elevation: 0,
      toolbarHeight: 80,
    ),
  );
}
