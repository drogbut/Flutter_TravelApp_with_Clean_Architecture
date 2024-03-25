import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/usecase.dart';
import '../../../../core/presentation/input_converter.dart';
import '../../data/models/flight_offer/flight_offer.dart';
import '../../domain/usecases/get_flight_offers_search.dart';

part 'flight_offers_event.dart';
part 'flight_offers_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero.';

class FlightOffersBloc extends Bloc<FlightOffersEvent, FlightOffersState> {
  final GetFlightOffersSearch getAvailableFlights;
  final InputConverter inputConverter;

  FlightOffersBloc({
    required this.getAvailableFlights,
    required this.inputConverter,
  }) : super(
          // initial state
          Empty(),
        ) {
    on<SearchAvailableFlights>(_loadedFlightOffers);
  }

  void _loadedFlightOffers(
    SearchAvailableFlights event,
    Emitter<FlightOffersState> emit,
  ) async {
    final inputResult =
        inputConverter.stringToInteger(event.params.numberOfPassengers);
    debugPrint('(1) ----> numberOfPassengers: $inputResult');

    await inputResult.fold(
      (failure) async {
        emit(const Error(message: invalidInputFailureMessage));
      },
      (number) async {
        try {
          emit(Loading());

          final params = AvailableFlightParams(
            departure: event.params.departure,
            arrival: event.params.arrival,
            departureDate: event.params.departureDate,
            numberOfPassengers: event.params.numberOfPassengers,
          );

          final result = await getAvailableFlights(params);
          debugPrint('(2) ----> Global result: $result');

          result.fold(
            (failure) {
              emit(Error(message: _mapFailureToMessage(failure)));
            },
            (flightOffers) {
              emit(Loaded(flightOffer: flightOffers));
            },
          );
        } catch (e) {
          debugPrint('serverFailureMessage: $e');
          emit(const Error(message: serverFailureMessage));
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
