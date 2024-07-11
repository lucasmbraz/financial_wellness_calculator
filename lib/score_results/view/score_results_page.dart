import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kalshi_score/score_results/view/score_indicator.dart';
import 'package:kalshi_score/widgets/widgets.dart';

class ScoreResultsPage extends StatelessWidget {
  const ScoreResultsPage({super.key});

  final score = Score.healthy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundTertiary,
      appBar: AppBar(
        title: SvgPicture.asset('assets/logo.svg', height: 20),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              AppCard(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/score_icon.svg', height: 48),
                      const SizedBox(height: 24),
                      ScoreIndicator(score: score),
                      const SizedBox(height: 24),
                      AppText.headingSmall(score.title),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Your financial wellness score is ",
                          style: AppTextStyles.paragraph.copyWith(
                            color: context.appColors.foregroundSecondary,
                          ),
                          children: [
                            TextSpan(
                              text: score.description,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
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
      ),
    );
  }
}

extension on Score {
  String get title {
    return switch (this) {
      Score.healthy => 'Congratulations!',
      Score.average => 'There is room for improvement.',
      Score.unhealthy => 'Caution!',
    };
  }

  String get description {
    return switch (this) {
      Score.healthy => 'Healthy.',
      Score.average => 'Average.',
      Score.unhealthy => 'Unhealthy.',
    };
  }
}
