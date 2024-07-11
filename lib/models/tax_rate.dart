const _defaultTaxRate = 0.08;

class TaxRate {
  const TaxRate([this.value = _defaultTaxRate])
      : assert(value >= 0 && value <= 1);

  final double value;

  @override
  String toString() => '${value * 100}%';
}
