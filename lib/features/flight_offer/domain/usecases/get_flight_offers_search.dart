import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/usecase.dart';
import '../../data/models/flight_offer/flight_offer.dart';
import '../repositories/amadeus_repository.dart';

/// Flight search: users can search for flights by specifying criteria such as
/// destination, departure and arrival dates, number of passengers, etc.

class GetFlightOffersSearch
    implements UseCase<FlightOffer, AvailableFlightParams> {
  final AmadeusRepository repository;
  GetFlightOffersSearch(this.repository);

  @override
  Future<Either<Failure, FlightOffer>> call(
      AvailableFlightParams params) async {
    return await repository.getFlightOffersSearch(
      params.departure,
      params.arrival,
      params.departureDate,
      params.numberOfPassengers,
    );
  }
}
