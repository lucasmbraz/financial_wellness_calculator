import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_score/models/models.dart';

void main() {
  group('Score', () {
    final testCases = <(NetIncome, AnnualCost, ScoreRating)>[
      (1000.netIncome, 100.annualCost, ScoreRating.healthy), // 10%
      (1000.netIncome, 250.annualCost, ScoreRating.healthy), // 25%
      (1000.netIncome, 300.annualCost, ScoreRating.average), // 30%
      (1000.netIncome, 750.annualCost, ScoreRating.average), // 75%
      (1000.netIncome, 800.annualCost, ScoreRating.unhealthy), // 80%
    ];

    for (final (
          NetIncome netIncome,
          AnnualCost annualCost,
          ScoreRating expected
        ) in testCases) {
      test(
        'GIVEN a net income of $netIncome '
        'AND annual cost of $annualCost '
        'THEN the score rating is $expected',
        () {
          final score = Score(
            annualNetIncome: netIncome,
            annualCost: annualCost,
          );

          expect(score.rating, expected);
        },
      );
    }
  });
}

class FakeAnnualCost extends Fake implements AnnualCost {
  FakeAnnualCost(this.value);

  @override
  final double value;
}

class FakeNetIncome extends Fake implements NetIncome {
  FakeNetIncome(this.value);

  @override
  final double value;
}

extension on num {
  FakeAnnualCost get annualCost => FakeAnnualCost(toDouble());

  FakeNetIncome get netIncome => FakeNetIncome(toDouble());
}
