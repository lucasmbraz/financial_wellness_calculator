import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_score/models/models.dart';
import 'package:kalshi_score/score_calculator/view/score_input_form.dart';

void main() {
  group('ScoreInputForm', () {
    final annualIncomeFinder = find.byKey(const Key('annualIncome'));
    final monthlyCostFinder = find.byKey(const Key('monthlyCost'));
    final continueButtonFinder = find.byKey(const Key('continueButton'));

    testWidgets(
        'WHEN annual income is zero '
        'AND the continue button is pressed '
        'THEN an error message is shown', (tester) async {
      await tester.pumpForm();

      await tester.enterText(annualIncomeFinder, '0');
      await tester.tap(continueButtonFinder);
      await tester.pump();

      expect(
          find.descendant(
            of: annualIncomeFinder,
            matching: find.text('Please enter a value greater than zero'),
          ),
          findsOneWidget);
    });

    testWidgets(
        'WHEN monthly cost is zero '
        'AND the continue button is pressed '
        'THEN an error message is shown', (tester) async {
      await tester.pumpForm();

      await tester.enterText(monthlyCostFinder, '0');
      await tester.tap(continueButtonFinder);
      await tester.pump();

      expect(
          find.descendant(
            of: monthlyCostFinder,
            matching: find.text('Please enter a value greater than zero'),
          ),
          findsOneWidget);
    });

    testWidgets(
        'WHEN the form is valid '
        'AND the continue button is pressed '
        'THEN no error message is displayed', (tester) async {
      await tester.pumpForm();

      await tester.enterText(annualIncomeFinder, '1000');
      await tester.enterText(monthlyCostFinder, '100');
      await tester.tap(continueButtonFinder);
      await tester.pump();

      expect(find.text('Please enter a value greater than zero'), findsNothing);
    });

    testWidgets(
        'WHEN the form is valid '
        'AND the continue button is pressed '
        'THEN onSubmit is called with the correct values', (tester) async {
      Money? annualIncome;
      Money? monthlyCost;

      await tester.pumpForm(onSubmit: (income, cost) {
        annualIncome = income;
        monthlyCost = cost;
      });

      await tester.enterText(annualIncomeFinder, '1000');
      await tester.enterText(monthlyCostFinder, '25');
      await tester.tap(continueButtonFinder);
      await tester.pump();

      expect(annualIncome?.value, 1000);
      expect(monthlyCost?.value, 25);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpForm({OnSubmit? onSubmit}) {
    return pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScoreInputForm(
            onSubmit: onSubmit ?? (_, __) {},
          ),
        ),
      ),
    );
  }
}
