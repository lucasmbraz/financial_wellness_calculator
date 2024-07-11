import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'score_calculator/score_calculator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const ScoreCalculatorPage(),
    );
  }
}
