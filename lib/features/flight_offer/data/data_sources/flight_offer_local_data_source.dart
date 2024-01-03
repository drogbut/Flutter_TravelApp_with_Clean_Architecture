import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
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

const cachedFlightOffer = 'CACHED_FLIGHT_OFFER';

class FlightOfferLocalDataSourceImpl extends FlightOfferLocalDataSource {
  final SharedPreferences sharedPreferences;
  FlightOfferLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<FlightOfferModel> getLastAvailableFlights() {
    final jsonString = sharedPreferences.getString(cachedFlightOffer);
    if (jsonString != null) {
      return Future.value(FlightOfferModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheAvailableFlights(FlightOfferModel flightOfferModel) {
    final jsonToString = json.encode(flightOfferModel.toJson());
    return sharedPreferences.setString(cachedFlightOffer, jsonToString);
  }
}
