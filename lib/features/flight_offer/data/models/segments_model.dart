import 'package:travel_app/features/flight_offer/data/models/aircraft_model.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival_model.dart';
import 'package:travel_app/features/flight_offer/data/models/departure_model.dart';
import 'package:travel_app/features/flight_offer/data/models/operating_model.dart';

import '../../domain/entities/segments.dart';

class SegmentsModel extends Segments {
  const SegmentsModel({
    required DepartureModel departure,
    required ArrivalModel arrival,
    String? carrierCode,
    String? number,
    AircraftModel? aircraft,
    OperatingModel? operating,
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
      departure:
          DepartureModel.fromJson(json['departure'] as Map<String, dynamic>),
      arrival: ArrivalModel.fromJson(json['arrival'] as Map<String, dynamic>),
      carrierCode: json['carrierCode'] as String?,
      number: json['number'] as String?,
      aircraft:
          AircraftModel.fromJson(json['aircraft'] as Map<String, dynamic>),
      operating:
          OperatingModel.fromJson(json['operating'] as Map<String, dynamic>),
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
