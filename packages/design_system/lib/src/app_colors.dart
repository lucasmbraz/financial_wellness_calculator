import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  Color get backgroundPrimary => Colors.white;

  Color get backgroundSecondary => const Color(0xFFE9EEF2);

  Color get backgroundTertiary => const Color(0xFFF4F8FA);

  Color get backgroundAccent => const Color(0xFF001C95);

  Color get foregroundPrimary => const Color(0xFF1E2A32);

  Color get foregroundSecondary => const Color(0xFF4D6475);

  Color get foregroundTertiary => const Color(0xFF708797);

  Color get foregroundAccent => const Color(0xFF001C95);

  Color get foregroundAlternative => Colors.white;

  Color get borderPrimary => const Color(0xFFE9EEF2);

  Color get borderAlternative => Colors.white;

  Color get borderAccent => const Color(0xFF001C95);

  Color get borderNegative => Colors.red.shade300;
}

extension AppColorsExtension on BuildContext {
  AppColors get appColors => const AppColors();
}
