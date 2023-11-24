import 'package:dartz/dartz.dart';
import 'package:travel_app/core/usecase/usecase.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../data/models/flight_offer/flight_offer.dart';
import '../repositories/flight_offer_repository.dart';

/// Flight search: users can search for flights by specifying criteria such as
/// destination, departure and arrival dates, number of passengers, etc.

class GetAvailableFlights implements UseCase<FlightOffer, NoParams> {
  final FlightOfferRepository repository;
  GetAvailableFlights(this.repository);

  @override
  Future<Either<Failure, FlightOffer>> call(NoParams params) async {
    return await repository.getAvailableFlights();
  }
}
