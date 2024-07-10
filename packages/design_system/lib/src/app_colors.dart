import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  Color get backgroundPrimary => Colors.white;
}

extension AppColorsExtension on BuildContext {
  AppColors get appColors => const AppColors();
}
