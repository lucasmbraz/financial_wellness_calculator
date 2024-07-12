import 'package:equatable/equatable.dart';
import 'package:kalshi_score/models/models.dart';

class AnnualCost extends Equatable implements Money {
  const AnnualCost({required Money monthlyCost}) : _monthlyCost = monthlyCost;

  final Money _monthlyCost;

  @override
  double get value => _monthlyCost.value * 12;

  @override
  String toString() => '\$$value';

  @override
  List<Object> get props => [_monthlyCost];
}
