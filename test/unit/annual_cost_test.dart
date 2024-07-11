import 'package:kalshi_score/extensions/extensions.dart';
import 'package:kalshi_score/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Annual Costs', () {
    final testCases = <(Money, double)>[
      (100.money, 1200),
      (3000.money, 36000),
    ];

    for (final (Money monthlyCost, double expected) in testCases) {
      test(
          'GIVEN $monthlyCost monthly cost '
          'THEN the annual cost is \$$expected', () {
        final annualCost = AnnualCost(monthlyCost: monthlyCost);
        expect(annualCost.value, expected);
      });
    }
  });
}
