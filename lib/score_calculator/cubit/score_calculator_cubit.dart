import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kalshi_score/models/models.dart';

part 'score_calculator_state.dart';

class ScoreCalculatorCubit extends Cubit<ScoreCalculatorState> {
  ScoreCalculatorCubit() : super(const ScoreCalculatorState());

  void calculateScore({
    required double annualIncome,
    required double monthlyCosts,
  }) {
    _resetRating();

    final score = Score(
      annualGrossIncome: annualIncome,
      monthlyCosts: monthlyCosts,
    );

    emit(state.copyWith(rating: score.rating));
  }

  void _resetRating() {
    emit(const ScoreCalculatorState());
  }
}
