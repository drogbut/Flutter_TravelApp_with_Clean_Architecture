part of 'flight_offers_bloc.dart';

abstract class FlightOffersEvent extends Equatable {
  const FlightOffersEvent();

  @override
  List<Object> get props => [];
}

class SearchAvailableFlights extends FlightOffersEvent {
  final FlightOfferParams params;

  const SearchAvailableFlights({required this.params});

  @override
  List<Object> get props => [params];
}
