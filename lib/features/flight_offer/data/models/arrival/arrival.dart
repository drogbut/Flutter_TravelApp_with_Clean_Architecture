import 'package:freezed_annotation/freezed_annotation.dart';

/// iataCode : "BRU"
/// at : "2024-01-03T05:05:00"

part 'arrival.freezed.dart';
part 'arrival.g.dart';

@freezed
class Arrival with _$Arrival {
  const factory Arrival({required String? iataCode, String? at}) = _Arrival;

  factory Arrival.fromJson(Map<String, Object?> json) =>
      _$ArrivalFromJson(json);
}
