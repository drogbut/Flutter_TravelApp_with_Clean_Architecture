import 'package:equatable/equatable.dart';
import 'package:travel_app/features/flight_offer/domain/entities/aircraft.dart';
import 'package:travel_app/features/flight_offer/domain/entities/arrival.dart';
import 'package:travel_app/features/flight_offer/domain/entities/departure.dart';
import 'package:travel_app/features/flight_offer/domain/entities/operating.dart';

/// departure : {"iataCode":"NSI","at":"2024-01-02T22:05:00"}
/// arrival : {"iataCode":"BRU","at":"2024-01-03T05:05:00"}
/// carrierCode : "LX"
/// number : "4540"
/// aircraft : {"code":"333"}
/// operating : {"carrierCode":"SN"}
/// duration : "PT7H"
/// id : "103"
/// numberOfStops : 0
/// blacklistedInEU : false

class Segments extends Equatable {
  final Departure? departure;
  final Arrival? arrival;
  final String? carrierCode;
  final String? number;
  final Aircraft? aircraft;
  final Operating? operating;
  final String? duration;
  final String? id;
  final num? numberOfStops;
  final bool? blacklistedInEU;

  const Segments({
    this.departure,
    this.arrival,
    this.carrierCode,
    this.number,
    this.aircraft,
    this.operating,
    this.duration,
    this.id,
    this.numberOfStops,
    this.blacklistedInEU,
  });

  @override
  List<Object?> get props => [
        departure,
        arrival,
        carrierCode,
        number,
        aircraft,
        operating,
        duration,
        id,
        numberOfStops,
        blacklistedInEU
      ];
}
