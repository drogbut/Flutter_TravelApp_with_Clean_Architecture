import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/flight_offer/flight_offer.dart';

abstract class FlightOfferLocalDataSource {
  /// Get the cache [FlightOffer] which was gotten the last time the user
  /// had an internet connection
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<FlightOffer> getLastAvailableFlights();

  Future<void> cacheAvailableFlights(FlightOffer flightOfferModel);
}

const cachedFlightOffer = 'CACHED_FLIGHT_OFFER';

class FlightOfferLocalDataSourceImpl extends FlightOfferLocalDataSource {
  final SharedPreferences sharedPreferences;
  FlightOfferLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<FlightOffer> getLastAvailableFlights() {
    final jsonString = sharedPreferences.getString(cachedFlightOffer);
    if (jsonString != null) {
      return Future.value(FlightOffer.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheAvailableFlights(FlightOffer flightOfferModel) {
    final jsonToString = json.encode(flightOfferModel.toJson());
    return sharedPreferences.setString(cachedFlightOffer, jsonToString);
  }
}
