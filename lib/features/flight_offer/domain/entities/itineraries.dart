import 'package:equatable/equatable.dart';
import 'package:travel_app/features/flight_offer/domain/entities/segments.dart';

/// duration : "PT11H55M"
/// segments : [{"departure":{"iataCode":"NSI","at":"2024-01-02T22:05:00"},"arrival":{"iataCode":"BRU","at":"2024-01-03T05:05:00"},"carrierCode":"LX","number":"4540","aircraft":{"code":"333"},"operating":{"carrierCode":"SN"},"duration":"PT7H","id":"103","numberOfStops":0,"blacklistedInEU":false},{"departure":{"iataCode":"BRU","at":"2024-01-03T06:40:00"},"arrival":{"iataCode":"ZRH","at":"2024-01-03T07:55:00"},"carrierCode":"LX","number":"4545","aircraft":{"code":"320"},"operating":{"carrierCode":"SN"},"duration":"PT1H15M","id":"104","numberOfStops":0,"blacklistedInEU":false},{"departure":{"iataCode":"ZRH","at":"2024-01-03T08:40:00"},"arrival":{"iataCode":"DUS","at":"2024-01-03T10:00:00"},"carrierCode":"LX","number":"4400","aircraft":{"code":"319"},"operating":{"carrierCode":"EW"},"duration":"PT1H20M","id":"105","numberOfStops":0,"blacklistedInEU":false}]

class Itineraries extends Equatable {
  final String? duration;
  final List<Segments>? segments;

  const Itineraries({this.duration, this.segments});

  @override
  List<Object?> get props => [duration, segments];
}
