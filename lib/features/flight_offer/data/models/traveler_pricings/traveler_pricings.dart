import 'package:freezed_annotation/freezed_annotation.dart';

import '../fare_details_by_segment/fare_details_by_segment.dart';
import '../price/price.dart';

part 'traveler_pricings.freezed.dart';
part 'traveler_pricings.g.dart';

@freezed
class TravelerPricings with _$TravelerPricings {
  const factory TravelerPricings({
    @Default('ADULT') String? travelerType,
    String? travelerId,
    String? fareOption,
    Price? price,
    List<FareDetailsBySegment>? fareDetailsBySegment,
  }) = _TravelerPricings;

  factory TravelerPricings.fromJson(Map<String, Object?> json) =>
      _$TravelerPricingsFromJson(json);
}
