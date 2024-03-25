// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightOfferImpl _$$FlightOfferImplFromJson(Map<String, dynamic> json) =>
    _$FlightOfferImpl(
      oneWay: json['oneWay'] as bool? ?? false,
      numberOfBookableSeats: json['numberOfBookableSeats'] as int? ?? 0,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      travelers: (json['travelerPricings'] as List<dynamic>?)
              ?.map((e) => TravelerPricings.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TravelerPricings>[],
      itineraries: (json['itineraries'] as List<dynamic>?)
          ?.map((e) => Itineraries.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
      id: json['id'] as String?,
      source: json['source'] as String?,
      instantTicketingRequired: json['instantTicketingRequired'] as bool?,
      nonHomogeneous: json['nonHomogeneous'] as bool?,
      lastTicketingDate: json['lastTicketingDate'] as String?,
      lastTicketingDateTime: json['lastTicketingDateTime'] as String?,
      pricingOptions: json['pricingOptions'] == null
          ? null
          : PricingOptions.fromJson(
              json['pricingOptions'] as Map<String, dynamic>),
      validatingAirlineCodes: (json['validatingAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$FlightOfferImplToJson(_$FlightOfferImpl instance) =>
    <String, dynamic>{
      'oneWay': instance.oneWay,
      'numberOfBookableSeats': instance.numberOfBookableSeats,
      'price': instance.price,
      'travelerPricings': instance.travelers,
      'itineraries': instance.itineraries,
      'type': instance.type,
      'id': instance.id,
      'source': instance.source,
      'instantTicketingRequired': instance.instantTicketingRequired,
      'nonHomogeneous': instance.nonHomogeneous,
      'lastTicketingDate': instance.lastTicketingDate,
      'lastTicketingDateTime': instance.lastTicketingDateTime,
      'pricingOptions': instance.pricingOptions,
      'validatingAirlineCodes': instance.validatingAirlineCodes,
    };
