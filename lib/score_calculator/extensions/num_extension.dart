import '../models/models.dart';

extension NumExtension on num {
  Money get money => Money(toDouble());

  TaxRate get taxRate => TaxRate(toDouble());
}
