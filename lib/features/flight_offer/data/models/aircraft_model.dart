import '../../domain/entities/aircraft.dart';

/// code : "333"

class AircraftModel extends Aircraft {
  const AircraftModel({
    required String? code,
  }) : super(
          code: code,
        );

  factory AircraftModel.fromJson(Map<String, dynamic> json) {
    return AircraftModel(
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
