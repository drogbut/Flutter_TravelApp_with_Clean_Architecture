import 'package:freezed_annotation/freezed_annotation.dart';

import '../included_checked_bags/included_checked_bags.dart';

part 'fare_details_by_segment.freezed.dart';
part 'fare_details_by_segment.g.dart';

@freezed
class FareDetailsBySegment with _$FareDetailsBySegment {
  const factory FareDetailsBySegment({
    String? segmentId,
    String? cabin,
    String? fareBasis,
    String? brandedFare,
    String? classe,
    IncludedCheckedBags? includedCheckedBags,
  }) = _FareDetailsBySegment;

  factory FareDetailsBySegment.fromJson(Map<String, Object?> json) =>
      _$FareDetailsBySegmentFromJson(json);
}
