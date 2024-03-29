// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightOfferImpl _$$FlightOfferImplFromJson(Map<String, dynamic> json) =>
    _$FlightOfferImpl(
      type: json['type'] as String?,
      id: json['id'] as String?,
      source: json['source'] as String?,
      instantTicketingRequired: json['instantTicketingRequired'] as bool?,
      nonHomogeneous: json['nonHomogeneous'] as bool?,
      oneWay: json['oneWay'] as bool?,
      lastTicketingDate: json['lastTicketingDate'] as String?,
      lastTicketingDateTime: json['lastTicketingDateTime'] as String?,
      numberOfBookableSeats: json['numberOfBookableSeats'] as int?,
      itineraries: (json['itineraries'] as List<dynamic>?)
          ?.map((e) => Itineraries.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      pricingOptions: json['pricingOptions'] == null
          ? null
          : PricingOptions.fromJson(
              json['pricingOptions'] as Map<String, dynamic>),
      validatingAirlineCodes: (json['validatingAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      travelerPricings: (json['travelerPricings'] as List<dynamic>?)
          ?.map((e) => TravelerPricings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FlightOfferImplToJson(_$FlightOfferImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'source': instance.source,
      'instantTicketingRequired': instance.instantTicketingRequired,
      'nonHomogeneous': instance.nonHomogeneous,
      'oneWay': instance.oneWay,
      'lastTicketingDate': instance.lastTicketingDate,
      'lastTicketingDateTime': instance.lastTicketingDateTime,
      'numberOfBookableSeats': instance.numberOfBookableSeats,
      'itineraries': instance.itineraries,
      'price': instance.price,
      'pricingOptions': instance.pricingOptions,
      'validatingAirlineCodes': instance.validatingAirlineCodes,
      'travelerPricings': instance.travelerPricings,
    };
