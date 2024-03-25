import 'package:freezed_annotation/freezed_annotation.dart';

import '../segments/segments.dart';

part 'itineraries.freezed.dart';
part 'itineraries.g.dart';

@freezed
class Itineraries with _$Itineraries {
  const factory Itineraries({
    @Default('PTOM') String? duration,
    List<Segments>? segments,
  }) = _Itineraries;

  factory Itineraries.fromJson(Map<String, Object?> json) =>
      _$ItinerariesFromJson(json);
}
