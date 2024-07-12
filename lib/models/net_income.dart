import 'package:equatable/equatable.dart';
import 'package:kalshi_score/models/models.dart';

class NetIncome extends Equatable implements Money {
  const NetIncome({
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

  @override
  List<Object> get props => [_grossIncome, _taxRate];
}
