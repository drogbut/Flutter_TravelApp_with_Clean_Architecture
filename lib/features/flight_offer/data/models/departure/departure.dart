import 'package:freezed_annotation/freezed_annotation.dart';

/// iataCode : "SYD"
/// terminal : "1"
/// at : "2023-12-02T10:45:00"

part 'departure.freezed.dart';
part 'departure.g.dart';

@freezed
class Departure with _$Departure {
  const factory Departure({
    required String? iataCode,
    required String? terminal,
    required String? at,
  }) = _Departure;

  factory Departure.fromJson(Map<String, Object?> json) =>
      _$DepartureFromJson(json);
}
