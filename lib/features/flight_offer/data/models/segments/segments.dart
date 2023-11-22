import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_app/features/flight_offer/data/models/aircraft/aircraft.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival/arrival.dart';
import 'package:travel_app/features/flight_offer/data/models/departure/departure.dart';
import 'package:travel_app/features/flight_offer/data/models/operating/operating.dart';

/// departure : {"iataCode":"SYD","terminal":"1","at":"2023-12-02T10:45:00"}
/// arrival : {"iataCode":"SGN","terminal":"2","at":"2023-12-02T15:30:00"}
/// carrierCode : "QH"
/// number : "87"
/// aircraft : {"code":"787"}
/// operating : {"carrierCode":"QH"}
/// duration : "PT8H45M"
/// id : "31"
/// numberOfStops : 0
/// blacklistedInEU : false

part 'segments.freezed.dart';
part 'segments.g.dart';

@freezed
class Segments with _$Segments {
  const factory Segments({
    required Departure? departure,
    required Arrival? arrival,
    required String? carrierCode,
    required String? number,
    required Aircraft? aircraft,
    required Operating? operating,
    required String? duration,
    required String? id,
    required num? numberOfStops,
    required bool? blacklistedInEU,
  }) = _Segments;

  factory Segments.fromJson(Map<String, Object?> json) =>
      _$SegmentsFromJson(json);
}
