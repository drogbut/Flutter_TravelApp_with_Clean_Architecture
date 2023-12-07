import '../../domain/entities/departure.dart';

/// iataCode : "BRU"
/// at : "2024-01-03T05:05:00"

class DepartureModel extends Departure {
  const DepartureModel({required String? iataCode, required String? at})
      : super(iataCode: iataCode, at: at);

  factory DepartureModel.fromJson(Map<String, dynamic> json) {
    return DepartureModel(
      iataCode: json['iataCode'],
      at: json['at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iataCode': iataCode,
      'at': at,
    };
  }
}
