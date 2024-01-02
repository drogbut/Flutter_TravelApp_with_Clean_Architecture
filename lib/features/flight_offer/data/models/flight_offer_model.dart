import 'package:travel_app/features/flight_offer/data/models/price_model.dart';
import 'package:travel_app/features/flight_offer/data/models/pricing_options_model.dart';
import 'package:travel_app/features/flight_offer/data/models/traveler_pricings_model.dart';

import '../../domain/entities/flight_offer.dart';
import 'itineraries_model.dart';

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
    List<ItinerariesModel>? itineraries,
    PriceModel? price,
    PricingOptionsModel? pricingOptions,
    List<String>? validatingAirlineCodes,
    List<TravelerPricingsModel>? travelerPricings,
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
      itineraries: (json['itineraries'] as List<ItinerariesModel>)
      /*.cast<Map<String, dynamic>>()
          .map((e) => ItinerariesModel.fromJson(e))
          .toList()*/
      ,
      price: json['price'] as PriceModel?,
      pricingOptions: json['pricingOptions'] as PricingOptionsModel?,
      validatingAirlineCodes: (json['validatingAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      travelerPricings:
          (json['travelerPricings'] as List<TravelerPricingsModel>?),
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
