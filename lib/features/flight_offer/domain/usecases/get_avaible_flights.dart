import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/usecase.dart';
import '../../data/models/flight_offer/flight_offer.dart';
import '../repositories/flight_offer_repository.dart';

/// Flight search: users can search for flights by specifying criteria such as
/// destination, departure and arrival dates, number of passengers, etc.

class GetAvailableFlights
    implements UseCase<FlightOffer, AvailableFlightParams> {
  final FlightOfferRepository repository;
  GetAvailableFlights(this.repository);

  @override
  Future<Either<Failure, FlightOffer>> call(
      AvailableFlightParams params) async {
    return await repository.getAvailableFlights(
      params.departure,
      params.arrival,
      params.departureDate,
      params.numberOfPassengers,
    );
  }
}
