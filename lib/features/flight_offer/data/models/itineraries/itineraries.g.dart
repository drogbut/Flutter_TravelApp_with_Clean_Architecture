// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itineraries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItinerariesImpl _$$ItinerariesImplFromJson(Map<String, dynamic> json) =>
    _$ItinerariesImpl(
      duration: json['duration'] as String?,
      segments: json['segments'] == null
          ? null
          : Segments.fromJson(json['segments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItinerariesImplToJson(_$ItinerariesImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'segments': instance.segments,
    };
