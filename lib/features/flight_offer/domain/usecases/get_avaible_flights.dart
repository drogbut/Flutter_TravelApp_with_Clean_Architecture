import 'package:dartz/dartz.dart';
import 'package:travel_app/core/usecase/usecase.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/flight_offer.dart';
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
    return await repository.getAvailableFlights(params.originLocationCode,
        params.destinationLocationCode, params.departureDate, params.adults);
  }
}
