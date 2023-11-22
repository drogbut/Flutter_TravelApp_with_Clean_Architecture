import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_app/features/flight_offer/data/models/itineraries/itineraries.dart';
import 'package:travel_app/features/flight_offer/data/models/price/price.dart';
import 'package:travel_app/features/flight_offer/data/models/pricing_options/pricing_options.dart';
import 'package:travel_app/features/flight_offer/data/models/traveler_pricings/traveler_pricings.dart';

/// type : "flight-offer"
/// id : "1"
/// source : "GDS"
/// instantTicketingRequired : false
/// nonHomogeneous : false
/// oneWay : false
/// lastTicketingDate : "2023-12-02"
/// lastTicketingDateTime : "2023-12-02"
/// numberOfBookableSeats : 9
/// itineraries : [{"duration":"PT28H15M","segments":[{"departure":{"iataCode":"SYD","terminal":"1","at":"2023-12-02T10:45:00"},"arrival":{"iataCode":"SGN","terminal":"2","at":"2023-12-02T15:30:00"},"carrierCode":"QH","number":"87","aircraft":{"code":"787"},"operating":{"carrierCode":"QH"},"duration":"PT8H45M","id":"31","numberOfStops":0,"blacklistedInEU":false},{"departure":{"iataCode":"SGN","terminal":"2","at":"2023-12-03T09:25:00"},"arrival":{"iataCode":"BKK","at":"2023-12-03T11:00:00"},"carrierCode":"QH","number":"325","aircraft":{"code":"320"},"operating":{"carrierCode":"QH"},"duration":"PT1H35M","id":"32","numberOfStops":0,"blacklistedInEU":false}]}]
/// price : {"currency":"EUR","total":"179.67","base":"60.00","fees":[{"amount":"0.00","type":"SUPPLIER"},{"amount":"0.00","type":"TICKETING"}],"grandTotal":"179.67"}
/// pricingOptions : {"fareType":["PUBLISHED"],"includedCheckedBagsOnly":true}
/// validatingAirlineCodes : ["QH"]
/// travelerPricings : [{"travelerId":"1","fareOption":"STANDARD","travelerType":"ADULT","price":{"currency":"EUR","total":"179.67","base":"60.00"},"fareDetailsBySegment":[{"segmentId":"31","cabin":"ECONOMY","fareBasis":"RLEOOWC","class":"R","includedCheckedBags":{"weight":45,"weightUnit":"KG"}},{"segmentId":"32","cabin":"ECONOMY","fareBasis":"RLEOOWC","class":"R","includedCheckedBags":{"weight":45,"weightUnit":"KG"}}]}]

part 'flight_offer.freezed.dart';
part 'flight_offer.g.dart';

@freezed
class FlightOffer with _$FlightOffer {
  const factory FlightOffer({
    String? type,
    required String? id,
    required String? source,
    bool? instantTicketingRequired,
    bool? nonHomogeneous,
    bool? oneWay,
    String? lastTicketingDate,
    String? lastTicketingDateTime,
    int? numberOfBookableSeats,
    Itineraries? itineraries,
    required Price? price,
    PricingOptions? pricingOptions,
    String? validatingAirlineCodes,
    TravelerPricings? travelerPricings,
  }) = _FlightOffer;

  factory FlightOffer.fromJson(Map<String, Object?> json) =>
      _$FlightOfferFromJson(json);
}
