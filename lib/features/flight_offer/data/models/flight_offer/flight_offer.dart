import 'package:freezed_annotation/freezed_annotation.dart';

import '../itineraries/itineraries.dart';
import '../price/price.dart';
import '../pricing_options/pricing_options.dart';
import '../traveler_pricings/traveler_pricings.dart';

part 'flight_offer.freezed.dart';
part 'flight_offer.g.dart';

@freezed
class FlightOffer with _$FlightOffer {
  const factory FlightOffer({
    @Default(false) bool? oneWay,
    @Default(0) int? numberOfBookableSeats,
    Price? price,
    @Default(<TravelerPricings>[])
    @JsonKey(name: 'travelerPricings')
    List<TravelerPricings>? travelers,
    required List<Itineraries>? itineraries,
    String? type,
    String? id,
    String? source,
    bool? instantTicketingRequired,
    bool? nonHomogeneous,
    String? lastTicketingDate,
    String? lastTicketingDateTime,
    PricingOptions? pricingOptions,
    List<String?>? validatingAirlineCodes,
  }) = _FlightOffer;

  factory FlightOffer.fromJson(Map<String, Object?> json) =>
      _$FlightOfferFromJson(json);
}
