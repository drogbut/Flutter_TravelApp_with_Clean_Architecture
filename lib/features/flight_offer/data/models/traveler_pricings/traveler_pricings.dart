import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_app/features/flight_offer/data/models/fare_details_by_segment/fare_details_by_segment.dart';
import 'package:travel_app/features/flight_offer/data/models/price/price.dart';

/// travelerId : "1"
/// fareOption : "STANDARD"
/// travelerType : "ADULT"
/// price : {"currency":"EUR","total":"179.67","base":"60.00"}
/// fareDetailsBySegment : [{"segmentId":"31","cabin":"ECONOMY","fareBasis":"RLEOOWC","class":"R","includedCheckedBags":{"weight":45,"weightUnit":"KG"}},{"segmentId":"32","cabin":"ECONOMY","fareBasis":"RLEOOWC","class":"R","includedCheckedBags":{"weight":45,"weightUnit":"KG"}}]

part 'traveler_pricings.freezed.dart';
part 'traveler_pricings.g.dart';

@freezed
class TravelerPricings with _$TravelerPricings {
  const factory TravelerPricings({
    required String? travelerId,
    required String? fareOption,
    required String? travelerType,
    required Price? price,
    required FareDetailsBySegment? fareDetailsBySegment,
  }) = _TravelerPricings;

  factory TravelerPricings.fromJson(Map<String, Object?> json) =>
      _$TravelerPricingsFromJson(json);
}
