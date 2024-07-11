import 'package:kalshi_score/models/models.dart';

class NetIncome implements Money {
  NetIncome({required this.grossIncome, required this.taxRate});

  final Money grossIncome;
  final TaxRate taxRate;

  @override
  double get value => grossIncome.value * (1 - taxRate.value);
}
