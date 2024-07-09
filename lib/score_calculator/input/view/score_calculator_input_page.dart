import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreCalculatorInputPage extends StatelessWidget {
  const ScoreCalculatorInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/logo.svg', height: 20),
      ),
      body: const Center(
        child: Text('Score Calculator Input Page'),
      ),
    );
  }
}
