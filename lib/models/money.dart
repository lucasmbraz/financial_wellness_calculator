class Money {
  const Money(this.value) : assert(value >= 0);

  final double value;

  @override
  String toString() => '\$$value';
}
