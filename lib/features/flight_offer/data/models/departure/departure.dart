import 'package:freezed_annotation/freezed_annotation.dart';

/// iataCode : "BRU"
/// at : "2024-01-03T05:05:00"

part 'departure.freezed.dart';
part 'departure.g.dart';

@freezed
class Departure with _$Departure {
  const factory Departure({
    required String? iataCode,
    required String? at,
  }) = _Departure;

  factory Departure.fromJson(Map<String, Object?> json) =>
      _$DepartureFromJson(json);
}
