import '../../domain/entities/aircraft.dart';
import '../../domain/entities/arrival.dart';
import '../../domain/entities/departure.dart';
import '../../domain/entities/operating.dart';
import '../../domain/entities/segments.dart';

class SegmentsModel extends Segments {
  const SegmentsModel({
    Departure? departure,
    Arrival? arrival,
    String? carrierCode,
    String? number,
    Aircraft? aircraft,
    Operating? operating,
    String? duration,
    String? id,
    num? numberOfStops,
    bool? blacklistedInEU,
  }) : super(
          departure: departure,
          arrival: arrival,
          carrierCode: carrierCode,
          number: number,
          aircraft: aircraft,
          operating: operating,
          duration: duration,
          id: id,
          numberOfStops: numberOfStops,
          blacklistedInEU: blacklistedInEU,
        );

  factory SegmentsModel.fromJson(Map<String, dynamic> json) {
    return SegmentsModel(
      departure: json['departure'] as Departure?,
      arrival: json['arrival'] as Arrival?,
      carrierCode: json['carrierCode'] as String?,
      number: json['number'] as String?,
      aircraft: json['aircraft'] as Aircraft?,
      operating: json['operating'] as Operating?,
      duration: json['duration'] as String?,
      id: json['id'] as String?,
      numberOfStops: json['numberOfStops'] as num?,
      blacklistedInEU: json['blacklistedInEU'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'departure': departure,
      'arrival': arrival,
      'carrierCode': carrierCode,
      'number': number,
      'aircraft': aircraft,
      'operating': operating,
      'duration': duration,
      'id': id,
      'numberOfStops': numberOfStops,
      'blacklistedInEU': blacklistedInEU,
    };
  }
}
