import 'package:freezed_annotation/freezed_annotation.dart';

import '../aircraft/aircraft.dart';
import '../arrival/arrival.dart';
import '../departure/departure.dart';
import '../operating/operating.dart';

part 'segments.freezed.dart';
part 'segments.g.dart';

@freezed
class Segments with _$Segments {
  const factory Segments({
    required Departure departure,
    required Arrival arrival,
    String? carrierCode,
    String? number,
    Aircraft? aircraft,
    Operating? operating,
    String? duration,
    String? id,
    num? numberOfStops,
    bool? blacklistedInEU,
  }) = _Segments;

  factory Segments.fromJson(Map<String, Object?> json) =>
      _$SegmentsFromJson(json);
}
