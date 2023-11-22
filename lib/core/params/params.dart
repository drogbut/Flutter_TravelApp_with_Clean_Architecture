import 'package:travel_app/features/flight_offer/data/models/arrival/arrival.dart';
import 'package:travel_app/features/flight_offer/data/models/departure/departure.dart';

class NoParams {}

class TemplateParams {}

class FlightOfferParams {
  final Departure departure;
  final Arrival arrival;
  final bool isAdults;

  const FlightOfferParams({
    required this.departure,
    required this.arrival,
    required this.isAdults,
  });
}
