const _incomeTax = 0.08;

enum ScoreRating {
  healthy,
  average,
  unhealthy,
}

class Score {
  const Score({
    required this.annualGrossIncome,
    required this.monthlyCosts,
  });

  final double annualGrossIncome;
  final double monthlyCosts;

  double get _annualNetIncome => annualGrossIncome * (1 - _incomeTax);

  double get _annualCosts => monthlyCosts * 12;

  double get _costsRatio => _annualCosts / _annualNetIncome;

  ScoreRating get rating => switch (_costsRatio) {
        < 0.25 => ScoreRating.healthy,
        < 0.75 => ScoreRating.average,
        _ => ScoreRating.unhealthy,
      };
}
