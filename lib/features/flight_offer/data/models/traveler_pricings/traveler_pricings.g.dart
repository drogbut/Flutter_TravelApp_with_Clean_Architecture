// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traveler_pricings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelerPricingsImpl _$$TravelerPricingsImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelerPricingsImpl(
      travelerType: json['travelerType'] as String? ?? 'ADULT',
      travelerId: json['travelerId'] as String?,
      fareOption: json['fareOption'] as String?,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      fareDetailsBySegment: (json['fareDetailsBySegment'] as List<dynamic>?)
          ?.map((e) => FareDetailsBySegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TravelerPricingsImplToJson(
        _$TravelerPricingsImpl instance) =>
    <String, dynamic>{
      'travelerType': instance.travelerType,
      'travelerId': instance.travelerId,
      'fareOption': instance.fareOption,
      'price': instance.price,
      'fareDetailsBySegment': instance.fareDetailsBySegment,
    };
