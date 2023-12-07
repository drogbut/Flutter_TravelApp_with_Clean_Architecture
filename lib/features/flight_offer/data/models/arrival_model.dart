import '../../domain/entities/arrival.dart';

/// iataCode : "BRU"
/// at : "2024-01-03T05:05:00"

class ArrivalModel extends Arrival {
  const ArrivalModel({required String? iataCode, String? at})
      : super(iataCode: iataCode, at: at);

  factory ArrivalModel.fromJson(Map<String, dynamic> json) {
    return ArrivalModel(
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
