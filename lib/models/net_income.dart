import 'package:kalshi_score/models/models.dart';

class NetIncome implements Money {
  NetIncome({
    required Money grossIncome,
    required TaxRate taxRate,
  })  : _grossIncome = grossIncome,
        _taxRate = taxRate;

  final Money _grossIncome;
  final TaxRate _taxRate;

  @override
  double get value => _grossIncome.value * (1 - _taxRate.value);

  @override
  String toString() => '\$$value';
}
