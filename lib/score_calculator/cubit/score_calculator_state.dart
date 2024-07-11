part of 'score_calculator_cubit.dart';

class ScoreCalculatorState extends Equatable {
  const ScoreCalculatorState({this.rating});

  final ScoreRating? rating;

  ScoreCalculatorState copyWith({ScoreRating? rating}) {
    return ScoreCalculatorState(
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [rating];
}
