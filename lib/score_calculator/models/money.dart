import 'package:equatable/equatable.dart';

class Money extends Equatable {
  const Money(this.value) : assert(value >= 0);

  final double value;

  @override
  String toString() => '\$$value';

  @override
  List<Object> get props => [value];
}
