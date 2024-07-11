import 'package:kalshi_score/models/models.dart';

enum ScoreRating {
  healthy,
  average,
  unhealthy,
}

class Score {
  Score({
    required NetIncome annualNetIncome,
    required AnnualCost annualCost,
  })  : _annualNetIncome = annualNetIncome,
        _annualCost = annualCost;

  final NetIncome _annualNetIncome;
  final AnnualCost _annualCost;

  double get _costsRatio => _annualCost.value / _annualNetIncome.value;

  ScoreRating get rating => switch (_costsRatio) {
        <= 0.25 => ScoreRating.healthy,
        <= 0.75 => ScoreRating.average,
        _ => ScoreRating.unhealthy,
      };
}
