import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/presentation/input_converter.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/flight_offer.dart';
import '../../domain/usecases/get_avaible_flights.dart';

part 'flight_offers_event.dart';
part 'flight_offers_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero.';

class FlightOffersBloc extends Bloc<FlightOffersEvent, FlightOffersState> {
  final GetAvailableFlights getAvailableFlights;
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
    final inputResult = inputConverter.stringToInteger(event.params.travelerId);

    await inputResult.fold(
      (failure) async {
        emit(const Error(message: invalidInputFailureMessage));
      },
      (number) async {
        try {
          emit(Loading());

          final params = AvailableFlightParams(
            originLocationCode: 'NSI',
            destinationLocationCode: 'DUS',
            departureDate: '2024-01-02T11:35:00',
            travelerId: number.toString(),
          );

          final result = await getAvailableFlights(params);

          result.fold(
            (failure) {
              emit(Error(message: _mapFailureToMessage(failure)));
            },
            (flightOffers) {
              emit(Loaded(flightOffer: flightOffers));
            },
          );
        } catch (e) {
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
