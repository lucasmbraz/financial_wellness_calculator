class TaxRate {
  const TaxRate(this.value) : assert(value >= 0 && value <= 1);

  final double value;

  @override
  String toString() => '${value * 100}%';
}
