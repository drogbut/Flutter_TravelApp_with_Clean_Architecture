import 'package:dartz/dartz.dart';
import 'package:travel_app/features/flight_offer/data/models/flight_offer/flight_offer.dart';

import '../../../../core/errors/failures/failure.dart';

abstract class FlightOfferRepository {
  Future<Either<Failure, FlightOffer>> getAvailableFlights();
}
