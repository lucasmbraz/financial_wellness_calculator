import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:kalshi_score/score_calculator/cubit/score_calculator_cubit.dart';
import 'package:kalshi_score/score_calculator/extensions/extensions.dart';
import 'package:kalshi_score/score_calculator/score_calculator.dart';
import 'package:kalshi_score/score_results/score_results.dart';
import 'package:kalshi_score/shared/shared.dart';
import 'package:mocktail/mocktail.dart';

import '../../golden_tests_utils.dart';

class MockScoreCalculatorCubit extends MockCubit<ScoreCalculatorState>
    implements ScoreCalculatorCubit {}

void main() {
  group('ScoreCalculatorPage', () {
    late MockScoreCalculatorCubit mockCubit;

    final annualIncomeFinder = find.byKey(const Key('annualIncome'));
    final monthlyCostFinder = find.byKey(const Key('monthlyCost'));
    final continueButtonFinder = find.byKey(const Key('continueButton'));

    setUp(() {
      mockCubit = MockScoreCalculatorCubit();
      when(() => mockCubit.state).thenReturn(const ScoreCalculatorState());
    });

    testWidgets(
      'WHEN the form is submitted '
      'THEN it passes the correct values to the cubit',
      (tester) async {
        await tester.pumpPage(mockCubit);

        await tester.enterText(annualIncomeFinder, '1000');
        await tester.enterText(monthlyCostFinder, '25');
        await tester.tap(continueButtonFinder);
        await tester.pump();

        verify(
          () => mockCubit.calculateScore(
              annualGrossIncome: 1000.money, monthlyCost: 25.money),
        ).called(1);
      },
    );

    testWidgets(
        'WHEN the cubit emits a scoreRating '
        'THEN it navigates to the results page', (tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable([
          const ScoreCalculatorState(),
          const ScoreCalculatorState(rating: ScoreRating.healthy),
        ]),
      );

      await tester.pumpPage(mockCubit);
      await tester.pumpAndSettle();

      expect(find.byType(ScoreResultsPage), findsOneWidget);
    });

    testGoldens('Renders Correctly', (tester) async {
      final builder = await deviceBuilder()
        ..addScenario(
          widget: const ScoreCalculatorPage(),
        );

      await tester.pumpDeviceBuilder(builder, wrapper: appWrapper());

      await screenMatchesGolden(tester, 'score_calculator_page');
    });
  });
}

extension on WidgetTester {
  Future<void> pumpPage(MockScoreCalculatorCubit cubit) {
    return pumpWidget(
      MaterialApp(home: ScoreCalculatorPage(cubit: cubit)),
    );
  }
}
