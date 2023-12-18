import 'package:travel_app/core/errors/exceptions.dart';

import '../models/flight_offer_model.dart';

abstract class FlightOfferLocalDataSource {
  /// Get the cache [FlightOfferModel] which was gotten the last time the user
  /// had an internet connection
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<FlightOfferModel> getLastAvailableFlights();

  Future<void> cacheAvailableFlights(FlightOfferModel flightOfferModel);
}
