import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:kalshi_score/score_results/score_results.dart';
import 'package:kalshi_score/shared/shared.dart';

import '../../golden_tests_utils.dart';

void main() {
  group('ScoreResultsPage', () {
    testWidgets(
        'WHEN rating is healthy '
        'THEN it displays the congratulations message', (tester) async {
      await tester.pumpPage(ScoreRating.healthy);

      expect(find.text('Congratulations!'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is Healthy.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'WHEN rating is average '
        'THEN it displays the warning message', (tester) async {
      await tester.pumpPage(ScoreRating.average);

      expect(find.text('There is room for improvement.'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is Average.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'WHEN rating is unhealthy '
        'THEN it displays caution message', (tester) async {
      await tester.pumpPage(ScoreRating.unhealthy);

      expect(find.text('Caution!'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is Unhealthy.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testGoldens('Renders Correctly', (tester) async {
      final builder = await deviceBuilder()
        ..addScenario(
          name: 'Healthy Score',
          widget: const ScoreResultsPage(scoreRating: ScoreRating.healthy),
        )
        ..addScenario(
          name: 'Average Score',
          widget: const ScoreResultsPage(scoreRating: ScoreRating.average),
        )
        ..addScenario(
          name: 'Unhealthy Score',
          widget: const ScoreResultsPage(scoreRating: ScoreRating.unhealthy),
        );

      await tester.pumpDeviceBuilder(builder, wrapper: appWrapper());

      await screenMatchesGolden(tester, 'score_results_page');
    });
  });
}

extension on WidgetTester {
  Future<void> pumpPage(ScoreRating rating) {
    return pumpWidget(
      MaterialApp(
        home: ScoreResultsPage(scoreRating: rating),
      ),
    );
  }
}
