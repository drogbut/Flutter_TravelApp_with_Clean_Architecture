import '../../features/flight_offer/domain/entities/arrival.dart';
import '../../features/flight_offer/domain/entities/departure.dart';

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
