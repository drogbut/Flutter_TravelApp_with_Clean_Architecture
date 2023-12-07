import '../../domain/entities/flight_offer.dart';
import '../../domain/entities/itineraries.dart';
import '../../domain/entities/price.dart';
import '../../domain/entities/pricing_options.dart';
import '../../domain/entities/traveler_pricings.dart';

class FlightOfferModel extends FlightOffer {
  const FlightOfferModel({
    String? type,
    String? id,
    String? source,
    bool? instantTicketingRequired,
    bool? nonHomogeneous,
    bool? oneWay,
    String? lastTicketingDate,
    String? lastTicketingDateTime,
    num? numberOfBookableSeats,
    List<Itineraries>? itineraries,
    Price? price,
    PricingOptions? pricingOptions,
    List<String>? validatingAirlineCodes,
    List<TravelerPricings>? travelerPricings,
  }) : super(
          type: type,
          id: id,
          source: source,
          instantTicketingRequired: instantTicketingRequired,
          nonHomogeneous: nonHomogeneous,
          oneWay: oneWay,
          lastTicketingDate: lastTicketingDate,
          lastTicketingDateTime: lastTicketingDateTime,
          numberOfBookableSeats: numberOfBookableSeats,
          itineraries: itineraries,
          price: price,
          pricingOptions: pricingOptions,
          validatingAirlineCodes: validatingAirlineCodes,
          travelerPricings: travelerPricings,
        );

  factory FlightOfferModel.fromJson(Map<String, dynamic> json) {
    return FlightOfferModel(
      type: json['type'] as String?,
      id: json['id'] as String?,
      source: json['source'] as String?,
      instantTicketingRequired: json['instantTicketingRequired'] as bool?,
      nonHomogeneous: json['nonHomogeneous'] as bool?,
      oneWay: json['oneWay'] as bool?,
      lastTicketingDate: json['lastTicketingDate'] as String?,
      lastTicketingDateTime: json['lastTicketingDateTime'] as String?,
      numberOfBookableSeats: json['numberOfBookableSeats'] as num?,
      itineraries: json['itineraries'] as List<Itineraries>?,
      price: json['price'] as Price?,
      pricingOptions: json['pricingOptions'] as PricingOptions?,
      validatingAirlineCodes: json['validatingAirlineCodes'] as List<String>?,
      travelerPricings: json['travelerPricings'] as List<TravelerPricings>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'source': source,
      'instantTicketingRequired': instantTicketingRequired,
      'nonHomogeneous': nonHomogeneous,
      'oneWay': oneWay,
      'lastTicketingDate': lastTicketingDate,
      'lastTicketingDateTime': lastTicketingDateTime,
      'numberOfBookableSeats': numberOfBookableSeats,
      'itineraries': itineraries,
      'price': price,
      'pricingOptions': pricingOptions,
      'validatingAirlineCodes': validatingAirlineCodes,
      'travelerPricings': travelerPricings,
    };
  }
}
