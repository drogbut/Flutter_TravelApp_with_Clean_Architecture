// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traveler_pricings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelerPricingsImpl _$$TravelerPricingsImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelerPricingsImpl(
      travelerId: json['travelerId'] as String?,
      fareOption: json['fareOption'] as String?,
      travelerType: json['travelerType'] as String?,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      fareDetailsBySegment: json['fareDetailsBySegment'] == null
          ? null
          : FareDetailsBySegment.fromJson(
              json['fareDetailsBySegment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TravelerPricingsImplToJson(
        _$TravelerPricingsImpl instance) =>
    <String, dynamic>{
      'travelerId': instance.travelerId,
      'fareOption': instance.fareOption,
      'travelerType': instance.travelerType,
      'price': instance.price,
      'fareDetailsBySegment': instance.fareDetailsBySegment,
    };
