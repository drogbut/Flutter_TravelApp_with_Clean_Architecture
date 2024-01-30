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
    String? type,
    String? id,
    String? source,
    bool? instantTicketingRequired,
    bool? nonHomogeneous,
    bool? oneWay,
    String? lastTicketingDate,
    String? lastTicketingDateTime,
    int? numberOfBookableSeats,
    List<Itineraries>? itineraries,
    Price? price,
    PricingOptions? pricingOptions,
    List<String?>? validatingAirlineCodes,
    List<TravelerPricings>? travelerPricings,
  }) = _FlightOffer;

  factory FlightOffer.fromJson(Map<String, Object?> json) =>
      _$FlightOfferFromJson(json);
}
