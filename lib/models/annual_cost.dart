import 'package:kalshi_score/models/models.dart';

class AnnualCost implements Money {
  AnnualCost({required Money monthlyCost}) : _monthlyCost = monthlyCost;

  final Money _monthlyCost;

  @override
  double get value => _monthlyCost.value * 12;

  @override
  String toString() => '\$$value';
}
