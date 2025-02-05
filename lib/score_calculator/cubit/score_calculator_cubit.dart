import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kalshi_score/shared/shared.dart';

import '../models/models.dart';

part 'score_calculator_state.dart';

const _defaultTaxRate = TaxRate(0.08);

class ScoreCalculatorCubit extends Cubit<ScoreCalculatorState> {
  ScoreCalculatorCubit() : super(const ScoreCalculatorState());

  void calculateScore({
    required Money annualGrossIncome,
    required Money monthlyCost,
  }) {
    _resetRating();

    final rating = _calculateScoreRating(
        annualGrossIncome: annualGrossIncome, monthlyCost: monthlyCost);

    emit(state.copyWith(rating: rating));
  }

  void _resetRating() {
    emit(const ScoreCalculatorState());
  }

  ScoreRating _calculateScoreRating({
    required Money annualGrossIncome,
    required Money monthlyCost,
  }) {
    final annualCost = AnnualCost(monthlyCost: monthlyCost);
    final netIncome = NetIncome(
      grossIncome: annualGrossIncome,
      taxRate: _defaultTaxRate,
    );
    final score = Score(
      annualCost: annualCost,
      annualNetIncome: netIncome,
    );
    return score.rating;
  }
}
