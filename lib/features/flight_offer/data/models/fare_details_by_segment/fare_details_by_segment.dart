import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_app/features/flight_offer/data/models/included_checked_bags/included_checked_bags.dart';

/// segmentId : "31"
/// cabin : "ECONOMY"
/// fareBasis : "RLEOOWC"
/// classe : "R"
/// includedCheckedBags : {"weight":45,"weightUnit":"KG"}

part 'fare_details_by_segment.freezed.dart';
part 'fare_details_by_segment.g.dart';

@freezed
class FareDetailsBySegment with _$FareDetailsBySegment {
  const factory FareDetailsBySegment({
    required String? segmentId,
    required String? cabin,
    required String? fareBasis,
    required String? classe,
    required IncludedCheckedBags? includedCheckedBags,
  }) = _FareDetailsBySegment;

  factory FareDetailsBySegment.fromJson(Map<String, Object?> json) =>
      _$FareDetailsBySegmentFromJson(json);
}
