import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../data/models/flight_offer/flight_offer.dart';
import '../repositories/flight_offer_repository.dart';

/// Flight search: users can search for flights by specifying criteria such as
/// destination, departure and arrival dates, number of passengers, etc.

class GetAvailableFlights {
  final FlightOfferRepository repository;
  GetAvailableFlights(this.repository);

  Future<Either<Failure, FlightOffer>> call() async {
    try {
      final flights = await repository.getAvailableFlights();
      return flights;
    } catch (e) {
      return Left(
        ServerFailure(
            errorMessage: "An error has occurred during flight recovery."),
      );
    }
  }
}
