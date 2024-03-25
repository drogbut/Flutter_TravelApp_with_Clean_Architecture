import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/flight_offer/flight_offer.dart';

abstract class AmadeusRepository {
  ///
  Future<Either<Failure, FlightOffer>> getFlightOffersSearch(
    String? originLocationCode,
    String? destinationLocationCode,
    String? departureDate,
    String? numberOfPassengers,
  );
}
