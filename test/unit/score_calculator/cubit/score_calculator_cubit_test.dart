import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_score/score_calculator/cubit/score_calculator_cubit.dart';
import 'package:kalshi_score/score_calculator/extensions/extensions.dart';
import 'package:kalshi_score/score_calculator/models/models.dart';
import 'package:kalshi_score/shared/shared.dart';

void main() {
  group('ScoreCalculatorCubit', () {
    late ScoreCalculatorCubit cubit;

    setUp(() {
      cubit = ScoreCalculatorCubit();
    });

    test('initial state is correct', () {
      expect(cubit.state, const ScoreCalculatorState());
    });

    group('calculateScore', () {
      final testCases = <(Money, Money, ScoreRating)>[
        (1000.money, 10.money, ScoreRating.healthy),
        (1000.money, 30.money, ScoreRating.average),
        (1000.money, 80.money, ScoreRating.unhealthy),
      ];

      for (final (Money annualIncome, Money monthlyCost, ScoreRating expected)
          in testCases) {
        blocTest<ScoreCalculatorCubit, ScoreCalculatorState>(
          'WHEN monthly cost is $monthlyCost and annual income is $annualIncome '
          'THEN it emits $expected score rating',
          build: () => cubit,
          act: (cubit) {
            cubit.calculateScore(
              annualGrossIncome: annualIncome,
              monthlyCost: monthlyCost,
            );
          },
          skip: 1,
          expect: () => [
            ScoreCalculatorState(rating: expected),
          ],
        );
      }
    });
  });
}
