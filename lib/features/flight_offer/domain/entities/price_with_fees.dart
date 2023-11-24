import 'package:equatable/equatable.dart';
import 'package:travel_app/features/flight_offer/domain/entities/fees.dart';

/// currency : "EUR"
/// total : "617.00"
/// base : "347.00"
/// fees : [{"amount":"0.00","type":"SUPPLIER"},{"amount":"0.00","type":"TICKETING"}]
/// grandTotal : "617.00"

class PriceWithFees extends Equatable {
  final String? currency;
  final String? total;
  final String? base;
  final List<Fees>? fees;
  final String? grandTotal;

  const PriceWithFees({
    this.currency,
    this.total,
    this.base,
    this.fees,
    this.grandTotal,
  });

  @override
  List<Object?> get props => [currency, total, base, fees, grandTotal];
}
