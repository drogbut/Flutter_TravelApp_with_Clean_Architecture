// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itineraries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItinerariesImpl _$$ItinerariesImplFromJson(Map<String, dynamic> json) =>
    _$ItinerariesImpl(
      duration: json['duration'] as String? ?? 'PTOM',
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItinerariesImplToJson(_$ItinerariesImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'segments': instance.segments,
    };
