import 'package:kalshi_score/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Net Income', () {
    final testCases = <(Money, TaxRate, double)>[
      (100.money, 0.1.taxRate, 90),
      (500.money, 0.1.taxRate, 450),
      (500.money, 0.25.taxRate, 375),
    ];

    for (final (Money grossIncome, TaxRate taxRate, double expected)
        in testCases) {
      test(
          'GIVEN $grossIncome at a tax rate of $taxRate '
          'THEN the net income is \$$expected', () {
        final netIncome = NetIncome(
          grossIncome: grossIncome,
          taxRate: taxRate,
        );

        expect(netIncome.value, expected);
      });
    }
  });
}

extension on num {
  Money get money => Money(toDouble());

  TaxRate get taxRate => TaxRate(toDouble());
}
