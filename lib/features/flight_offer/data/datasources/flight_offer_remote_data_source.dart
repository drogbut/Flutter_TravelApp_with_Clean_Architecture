import 'package:travel_app/core/errors/exceptions.dart';
import 'package:travel_app/features/flight_offer/data/models/flight_offer_model.dart';

abstract class FlightOfferRemoteDataSource {
  /// call the https://test.api.amadeus.com/v2 endpoint.
  ///
  /// Throws a [ServerException] for all errors codes.
  Future<FlightOfferModel> getAvailableFlights({
    required String? originLocationCode,
    required String? destinationLocationCode,
    required String? departureDate,
    required String? adults,
  });
}
