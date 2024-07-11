import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kalshi_score/models/models.dart';

part 'score_calculator_state.dart';

const _defaultTaxRate = TaxRate(0.08);

class ScoreCalculatorCubit extends Cubit<ScoreCalculatorState> {
  ScoreCalculatorCubit() : super(const ScoreCalculatorState());

  void calculateScore({
    required Money annualGrossIncome,
    required Money monthlyCost,
  }) {
    _resetRating();

    final score = _calculateScore(
        annualGrossIncome: annualGrossIncome, monthlyCost: monthlyCost);

    emit(state.copyWith(rating: score.rating));
  }

  void _resetRating() {
    emit(const ScoreCalculatorState());
  }

  Score _calculateScore({
    required Money annualGrossIncome,
    required Money monthlyCost,
  }) {
    final annualCost = AnnualCost(monthlyCost: monthlyCost);
    final netIncome = NetIncome(
      grossIncome: annualGrossIncome,
      taxRate: _defaultTaxRate,
    );
    return Score(
      annualCost: annualCost,
      annualNetIncome: netIncome,
    );
  }
}
