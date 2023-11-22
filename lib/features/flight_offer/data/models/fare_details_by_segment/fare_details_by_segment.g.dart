// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_details_by_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FareDetailsBySegmentImpl _$$FareDetailsBySegmentImplFromJson(
        Map<String, dynamic> json) =>
    _$FareDetailsBySegmentImpl(
      segmentId: json['segmentId'] as String?,
      cabin: json['cabin'] as String?,
      fareBasis: json['fareBasis'] as String?,
      classe: json['classe'] as String?,
      includedCheckedBags: json['includedCheckedBags'] == null
          ? null
          : IncludedCheckedBags.fromJson(
              json['includedCheckedBags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FareDetailsBySegmentImplToJson(
        _$FareDetailsBySegmentImpl instance) =>
    <String, dynamic>{
      'segmentId': instance.segmentId,
      'cabin': instance.cabin,
      'fareBasis': instance.fareBasis,
      'classe': instance.classe,
      'includedCheckedBags': instance.includedCheckedBags,
    };
