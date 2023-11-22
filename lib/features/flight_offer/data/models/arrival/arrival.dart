import 'package:freezed_annotation/freezed_annotation.dart';

/// iataCode : "SGN"
/// terminal : "2"
/// at : "2023-12-02T15:30:00"

part 'arrival.freezed.dart';
part 'arrival.g.dart';

@freezed
class Arrival with _$Arrival {
  const factory Arrival({
    required String? iataCode,
    required String? terminal,
    required String? at,
  }) = _Arrival;

  factory Arrival.fromJson(Map<String, Object?> json) =>
      _$ArrivalFromJson(json);
}
