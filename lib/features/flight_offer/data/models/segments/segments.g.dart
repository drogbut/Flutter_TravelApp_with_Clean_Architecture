// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SegmentsImpl _$$SegmentsImplFromJson(Map<String, dynamic> json) =>
    _$SegmentsImpl(
      departure: json['departure'] == null
          ? null
          : Departure.fromJson(json['departure'] as Map<String, dynamic>),
      arrival: json['arrival'] == null
          ? null
          : Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
      carrierCode: json['carrierCode'] as String?,
      number: json['number'] as String?,
      aircraft: json['aircraft'] == null
          ? null
          : Aircraft.fromJson(json['aircraft'] as Map<String, dynamic>),
      operating: json['operating'] == null
          ? null
          : Operating.fromJson(json['operating'] as Map<String, dynamic>),
      duration: json['duration'] as String?,
      id: json['id'] as String?,
      numberOfStops: json['numberOfStops'] as num?,
      blacklistedInEU: json['blacklistedInEU'] as bool?,
    );

Map<String, dynamic> _$$SegmentsImplToJson(_$SegmentsImpl instance) =>
    <String, dynamic>{
      'departure': instance.departure,
      'arrival': instance.arrival,
      'carrierCode': instance.carrierCode,
      'number': instance.number,
      'aircraft': instance.aircraft,
      'operating': instance.operating,
      'duration': instance.duration,
      'id': instance.id,
      'numberOfStops': instance.numberOfStops,
      'blacklistedInEU': instance.blacklistedInEU,
    };
