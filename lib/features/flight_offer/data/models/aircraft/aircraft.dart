import 'package:freezed_annotation/freezed_annotation.dart';

/// code : "333"

part 'aircraft.freezed.dart';
part 'aircraft.g.dart';

@freezed
class Aircraft with _$Aircraft {
  const factory Aircraft({required String? code}) = _Aircraft;

  factory Aircraft.fromJson(Map<String, Object?> json) =>
      _$AircraftFromJson(json);
}
