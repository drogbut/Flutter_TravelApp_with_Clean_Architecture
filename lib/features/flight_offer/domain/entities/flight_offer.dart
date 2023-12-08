import 'package:equatable/equatable.dart';
import 'package:travel_app/features/flight_offer/domain/entities/itineraries.dart';
import 'package:travel_app/features/flight_offer/domain/entities/price.dart';
import 'package:travel_app/features/flight_offer/domain/entities/pricing_options.dart';
import 'package:travel_app/features/flight_offer/domain/entities/traveler_pricings.dart';

/// type : "flight-offer"
/// id : "1"
/// source : "GDS"
/// instantTicketingRequired : false
/// nonHomogeneous : false
/// oneWay : false
/// lastTicketingDate : "2023-11-27"
/// lastTicketingDateTime : "2023-11-27"
/// numberOfBookableSeats : 4
/// itineraries : [{"duration":"PT11H55M","segments":[{"departure":{"iataCode":"NSI","at":"2024-01-02T22:05:00"},"arrival":{"iataCode":"BRU","at":"2024-01-03T05:05:00"},"carrierCode":"LX","number":"4540","aircraft":{"code":"333"},"operating":{"carrierCode":"SN"},"duration":"PT7H","id":"103","numberOfStops":0,"blacklistedInEU":false},{"departure":{"iataCode":"BRU","at":"2024-01-03T06:40:00"},"arrival":{"iataCode":"ZRH","at":"2024-01-03T07:55:00"},"carrierCode":"LX","number":"4545","aircraft":{"code":"320"},"operating":{"carrierCode":"SN"},"duration":"PT1H15M","id":"104","numberOfStops":0,"blacklistedInEU":false},{"departure":{"iataCode":"ZRH","at":"2024-01-03T08:40:00"},"arrival":{"iataCode":"DUS","at":"2024-01-03T10:00:00"},"carrierCode":"LX","number":"4400","aircraft":{"code":"319"},"operating":{"carrierCode":"EW"},"duration":"PT1H20M","id":"105","numberOfStops":0,"blacklistedInEU":false}]}]
/// price : {"currency":"EUR","total":"617.00","base":"347.00","fees":[{"amount":"0.00","type":"SUPPLIER"},{"amount":"0.00","type":"TICKETING"}],"grandTotal":"617.00"}
/// pricingOptions : {"fareType":["PUBLISHED"],"includedCheckedBagsOnly":true}
/// validatingAirlineCodes : ["LX"]
/// travelerPricings : [{"travelerId":"1","fareOption":"STANDARD","travelerType":"ADULT","price":{"currency":"EUR","total":"617.00","base":"347.00"},"fareDetailsBySegment":[{"segmentId":"103","cabin":"ECONOMY","fareBasis":"TNCOWCM","brandedFare":"ECOSAVERA","class":"T","includedCheckedBags":{"quantity":1}},{"segmentId":"104","cabin":"ECONOMY","fareBasis":"TNCOWCM","brandedFare":"ECOSAVERA","class":"T","includedCheckedBags":{"quantity":1}},{"segmentId":"105","cabin":"ECONOMY","fareBasis":"TNCOWCM","brandedFare":"ECOSAVERA","class":"T","includedCheckedBags":{"quantity":1}}]}]

class FlightOffer extends Equatable {
  final String? type;
  final String? id;
  final String? source;
  final bool? instantTicketingRequired;
  final bool? nonHomogeneous;
  final bool? oneWay;
  final String? lastTicketingDate;
  final String? lastTicketingDateTime;
  final num? numberOfBookableSeats;
  final List<Itineraries>? itineraries;
  final Price? price;
  final PricingOptions? pricingOptions;
  final List<String>? validatingAirlineCodes;
  final List<TravelerPricings>? travelerPricings;

  const FlightOffer({
    this.type,
    required this.id,
    this.source,
    this.instantTicketingRequired,
    this.nonHomogeneous,
    this.oneWay,
    this.lastTicketingDate,
    this.lastTicketingDateTime,
    this.numberOfBookableSeats,
    required this.itineraries,
    this.price,
    this.pricingOptions,
    this.validatingAirlineCodes,
    required this.travelerPricings,
  });

  @override
  List<Object?> get props => [
        type,
        id,
        source,
        instantTicketingRequired,
        nonHomogeneous,
        oneWay,
        lastTicketingDate,
        lastTicketingDateTime,
        numberOfBookableSeats,
        itineraries,
        price,
        pricingOptions,
        validatingAirlineCodes,
        travelerPricings
      ];
}
