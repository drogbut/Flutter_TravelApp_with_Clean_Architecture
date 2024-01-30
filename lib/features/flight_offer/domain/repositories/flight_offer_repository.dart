import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/flight_offer/flight_offer.dart';

abstract class FlightOfferRepository {
  Future<Either<Failure, FlightOffer>> getAvailableFlights(
      String? originLocationCode,
      String? destinationLocationCode,
      String? departureDate,
      String? numberOfPassengers);
}
