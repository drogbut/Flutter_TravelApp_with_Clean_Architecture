import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/errors/exceptions.dart';

import '../../../../core/Keys/my_keys.dart';
import '../models/flight_offer/flight_offer.dart';

abstract class FlightOfferRemoteDataSource {
  Future<String> getAccessToken();

  /// call the https://test.api.amadeus.com/v2 endpoint.
  ///
  /// Throws a [ServerException] for all errors codes.
  Future<FlightOffer> getAvailableFlights({
    required String? originLocationCode,
    required String? destinationLocationCode,
    required String? departureDate,
    required String? numberOfPassengers,
  });
}

class FlightOfferRemoteDataSourceImpl extends FlightOfferRemoteDataSource {
  final Dio client;
  FlightOfferRemoteDataSourceImpl({required this.client});

  @override
  Future<String> getAccessToken() async {
    try {
      final response = await client.post(
        MyKeys.amadeusServerUrl,
        data: {
          'grant_type': 'client_credentials',
          'client_id': MyKeys.amadeusApiKey,
          'client_secret': MyKeys.amadeusApiSecret,
        },
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      if (response.statusCode == 200) {
        return response.data['access_token'];
      } else {
        throw DioException(
          response: response,
          requestOptions: RequestOptions(path: MyKeys.amadeusServerUrl),
        );
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<FlightOffer> getAvailableFlights({
    required String? originLocationCode,
    required String? destinationLocationCode,
    required String? departureDate,
    required String? numberOfPassengers,
  }) async {
    final accessToken = await getAccessToken();

    final response = await client.get(
      'https://test.api.amadeus.com/v2/shopping/flight-offers',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      queryParameters: {
        'originLocationCode': originLocationCode,
        'destinationLocationCode': destinationLocationCode,
        'departureDate': departureDate,
        'adults': numberOfPassengers,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("Response-data: ${response.data}");
      final Map<String, dynamic> responseData = response.data;
      final flightOfferModel = FlightOffer.fromJson(responseData);
      return flightOfferModel;
    } else {
      throw ServerException();
    }
  }
}
