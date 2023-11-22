import 'package:dio/dio.dart';

import '../../../../core/Keys/my_keys.dart';

class ServiceApi {
  /// (1) Configure dio
  final Dio dio = Dio();
  final String serverUrl = MyKeys.amadeusServerUrl;
  final String amadeusApiKey = MyKeys.amadeusApiKey;
  final String amadeusApiSecret = MyKeys.amadeusApiSecret;

  ServiceApi() {
    dio.options.baseUrl = serverUrl;
  }

  /// (2) POST-request to obtains the access token
  Future<String> getAccessToken() async {
    final response = await dio.post(
      serverUrl,
      data: {
        'grant_type': 'client_credentials',
        'client_id': amadeusApiKey,
        'client_secret': amadeusApiSecret,
      },
      options: Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      ),
    );
    if (response.statusCode == 200) {
      return response.data['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }

  /// (3) Use the token to fetch data
  Future<Map<String, dynamic>> fetchFlightOffers(String accessToken) async {
    try {
      final response = await dio.get(
        'https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=SYD&destinationLocationCode=BKK&departureDate=2023-12-02&adults=1&nonStop=false&max=250',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        return responseData;
      } else {
        throw Exception('Failed to fetch protected resource');
      }
    } catch (e) {
      throw Exception('Failed to fetch protected resource: $e');
    }
  }
}
