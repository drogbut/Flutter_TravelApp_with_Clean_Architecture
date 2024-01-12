part of 'flight_offers_bloc.dart';

abstract class FlightOffersState extends Equatable {
  const FlightOffersState();

  @override
  List<Object> get props => [];
}

class Empty extends FlightOffersState {}

class Loading extends FlightOffersState {}

class Loaded extends FlightOffersState {
  final FlightOffer flightOffer;

  const Loaded({required this.flightOffer});

  @override
  List<Object> get props => [flightOffer];
}

class Error extends FlightOffersState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
