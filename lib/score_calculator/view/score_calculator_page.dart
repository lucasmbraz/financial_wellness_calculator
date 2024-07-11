import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kalshi_score/score_calculator/cubit/score_calculator_cubit.dart';
import 'package:kalshi_score/score_calculator/view/score_input_form.dart';
import 'package:kalshi_score/score_results/score_results.dart';
import 'package:kalshi_score/widgets/widgets.dart';

class ScoreCalculatorPage extends StatelessWidget {
  const ScoreCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScoreCalculatorCubit(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScoreCalculatorCubit, ScoreCalculatorState>(
      listener: (context, state) {
        final rating = state.rating;
        if (rating != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ScoreResultsPage(scoreRating: rating),
            ),
          );
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: const KalshiAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Let's find out your ",
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
                          const SizedBox(height: 16),
                          AppText.headingSmall('Financial wellness test'),
                          AppText.paragraph(
                            'Enter your financial information below',
                            color: context.appColors.foregroundTertiary,
                          ),
                          const SizedBox(height: 16),
                          ScoreInputForm(
                            onSubmit: (annualIncome, monthlyCost) => context
                                .read<ScoreCalculatorCubit>()
                                .calculateScore(
                                  annualGrossIncome: annualIncome,
                                  monthlyCost: monthlyCost,
                                ),
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
        ),
      ),
    );
  }
}
