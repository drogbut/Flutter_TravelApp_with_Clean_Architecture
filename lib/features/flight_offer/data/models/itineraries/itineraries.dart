import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_app/features/flight_offer/data/models/segments/segments.dart';

/// duration : "PT28H15M"
/// segments : [{"departure":{"iataCode":"SYD","terminal":"1","at":"2023-12-02T10:45:00"},"arrival":{"iataCode":"SGN","terminal":"2","at":"2023-12-02T15:30:00"},"carrierCode":"QH","number":"87","aircraft":{"code":"787"},"operating":{"carrierCode":"QH"},"duration":"PT8H45M","id":"31","numberOfStops":0,"blacklistedInEU":false},{"departure":{"iataCode":"SGN","terminal":"2","at":"2023-12-03T09:25:00"},"arrival":{"iataCode":"BKK","at":"2023-12-03T11:00:00"},"carrierCode":"QH","number":"325","aircraft":{"code":"320"},"operating":{"carrierCode":"QH"},"duration":"PT1H35M","id":"32","numberOfStops":0,"blacklistedInEU":false}]

part 'itineraries.freezed.dart';
part 'itineraries.g.dart';

@freezed
class Itineraries with _$Itineraries {
  const factory Itineraries({
    required String? duration,
    required Segments? segments,
  }) = _Itineraries;

  factory Itineraries.fromJson(Map<String, Object?> json) =>
      _$ItinerariesFromJson(json);
}
