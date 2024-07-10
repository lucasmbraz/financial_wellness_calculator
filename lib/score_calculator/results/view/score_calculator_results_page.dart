import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kalshi_score/score_calculator/widgets/footer.dart';

class ScoreCalculatorResultsPage extends StatelessWidget {
  const ScoreCalculatorResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundSecondary,
      appBar: AppBar(
        title: SvgPicture.asset('assets/logo.svg', height: 20),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Here's your ",
                style: AppTextStyles.subtitle.copyWith(
                  color: context.appColors.foregroundAccent,
                ),
                children: [
                  TextSpan(
                    text: 'financial wellness score.',
                    style: AppTextStyles.subtitleLg,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/score_icon.svg', height: 48),
                    const SizedBox(height: 16),
                    AppText.headingSmall('Congratulations!'),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Your financial wellness score is ",
                        style: AppTextStyles.paragraph.copyWith(
                          color: context.appColors.foregroundSecondary,
                        ),
                        children: const [
                          TextSpan(
                            text: 'Healthy.',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    AppButton.secondary(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Return'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
