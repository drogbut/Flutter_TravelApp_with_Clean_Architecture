import 'package:equatable/equatable.dart';

/// currency : "EUR"
/// total : "617.00"
/// base : "347.00"

class Price extends Equatable {
  const Price({
    this.currency,
    this.total,
    this.base,
  });

  final String? currency;
  final String? total;
  final String? base;

  @override
  List<Object?> get props => [currency, total, base];
}
