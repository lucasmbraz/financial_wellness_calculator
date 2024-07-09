import 'package:flutter/material.dart';

import 'score_calculator/score_calculator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScoreCalculatorInputPage(),
    );
  }
}
