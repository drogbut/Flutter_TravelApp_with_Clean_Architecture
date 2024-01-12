class NoParams {}

class TemplateParams {}

class FlightOfferParams {
  final String departure;
  final String arrival;
  final String departureDate;
  final String travelerId;

  const FlightOfferParams({
    required this.departure,
    required this.arrival,
    required this.departureDate,
    required this.travelerId,
  });
}
