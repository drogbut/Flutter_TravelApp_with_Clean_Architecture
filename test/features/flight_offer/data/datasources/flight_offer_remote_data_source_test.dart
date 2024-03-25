import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/core/Keys/my_keys.dart';
import 'package:travel_app/core/errors/exceptions.dart';
import 'package:travel_app/features/flight_offer/data/data_sources/flight_offer_remote_data_source.dart';
import 'package:travel_app/features/flight_offer/data/models/aircraft/aircraft.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival/arrival.dart';
import 'package:travel_app/features/flight_offer/data/models/departure/departure.dart';
import 'package:travel_app/features/flight_offer/data/models/fare_details_by_segment/fare_details_by_segment.dart';
import 'package:travel_app/features/flight_offer/data/models/flight_offer/flight_offer.dart';
import 'package:travel_app/features/flight_offer/data/models/included_checked_bags/included_checked_bags.dart';
import 'package:travel_app/features/flight_offer/data/models/itineraries/itineraries.dart';
import 'package:travel_app/features/flight_offer/data/models/operating/operating.dart';
import 'package:travel_app/features/flight_offer/data/models/price/price.dart';
import 'package:travel_app/features/flight_offer/data/models/pricing_options/pricing_options.dart';
import 'package:travel_app/features/flight_offer/data/models/segments/segments.dart';
import 'package:travel_app/features/flight_offer/data/models/traveler_pricings/traveler_pricings.dart';

import 'flight_offer_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late FlightOfferRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = FlightOfferRemoteDataSourceImpl(client: mockDio);
  });

  group("GetAccessToken", () {
    final String serverUrl = MyKeys.amadeusServerUrl;
    final String amadeusApiKey = MyKeys.amadeusApiKey;
    final String amadeusApiSecret = MyKeys.amadeusApiSecret;

    test('Should return a accessToken when getAccessToken is success',
        () async {
      // Arrange
      when(mockDio.post(
        serverUrl,
        data: {
          'grant_type': 'client_credentials',
          'client_id': amadeusApiKey,
          'client_secret': amadeusApiSecret,
        },
        options: anyNamed('options'),
      )).thenAnswer((_) async => Response(
            statusCode: 200,
            data: {'access_token': 'valid_token'},
            requestOptions: RequestOptions(),
          ));

      // Act
      final result = await dataSource.getAccessToken();

      // Assert
      expect(result, 'valid_token');
    });

    test('Should throw a ServerException when getAccessToken fails', () async {
      // Arrange
      when(mockDio.post(
        serverUrl,
        data: {
          'grant_type': 'client_credentials',
          'client_id': amadeusApiKey,
          'client_secret': amadeusApiSecret,
        },
        options: anyNamed('options'),
      )).thenThrow(DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 401,
          ),
          type: DioExceptionType.badResponse));

      // Act
      final call = dataSource.getAccessToken;

      // Assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });

  group("Fetch remote data sources ", () {
    final String serverUrl = MyKeys.amadeusServerUrl;
    final String amadeusApiKey = MyKeys.amadeusApiKey;
    final String amadeusApiSecret = MyKeys.amadeusApiSecret;

    test('Should return a FlightOffer when the call is successful', () async {
      // Arrange
      when(mockDio.post(serverUrl,
              data: {
                'grant_type': 'client_credentials',
                'client_id': amadeusApiKey,
                'client_secret': amadeusApiSecret,
              },
              options: anyNamed('options'),
              queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => Response(
                statusCode: 200,
                data: {'access_token': 'valid_token'},
                requestOptions: RequestOptions(),
              ));

      when(mockDio.get(
        'https://test.api.amadeus.com/v2/shopping/flight-offers',
        options: anyNamed('options'),
        queryParameters: {
          'originLocationCode': 'SYD',
          'destinationLocationCode': 'BKK',
          'departureDate': '2023-12-02',
          'adults': '1',
        },
      )).thenAnswer((_) async => Response(
            statusCode: 200,
            data: json.encode(tFlightOffer.toJson()),
            requestOptions: RequestOptions(
              path: '/v2/shopping/flight-offers',
            ),
          ));

      // Act
      final result1 = await dataSource.getAccessToken();
      final result2 = await dataSource.getAvailableFlights(
        originLocationCode: 'SYD',
        destinationLocationCode: 'BKK',
        departureDate: '2023-12-02',
        numberOfPassengers: '1',
      );

      // Assert
      expect(result1, 'valid_token');
      expect(result2, equals(tFlightOffer));
    });

    test(
        'should throw a ServerException when the response code is 400 or other',
        () async {
      // Arrange
      when(mockDio.post(
        serverUrl,
        data: {
          'grant_type': 'client_credentials',
          'client_id': amadeusApiKey,
          'client_secret': amadeusApiSecret,
        },
        options: anyNamed('options'),
      )).thenAnswer((_) async => Response(
            statusCode: 200,
            data: {'access_token': 'valid_token'},
            requestOptions: RequestOptions(),
          ));

      when(mockDio.get(
        'https://test.api.amadeus.com/v2/shopping/flight-offers',
        options: anyNamed('options'),
        queryParameters: {
          'originLocationCode': 'SYD',
          'destinationLocationCode': 'BKK',
          'departureDate': '2023-12-02',
          'adults': '1',
        },
      )).thenAnswer((_) async => Response(
            statusCode: 400,
            data: {'error': 'Bad Request'},
            requestOptions: RequestOptions(
              path: '/v2/shopping/flight-offers',
            ),
          ));

      // Act
      final Future<void> result = dataSource.getAvailableFlights(
        originLocationCode: 'SYD',
        destinationLocationCode: 'BKK',
        departureDate: '2023-12-02',
        numberOfPassengers: '1',
      );

      // Assert
      await expectLater(result, throwsA(isA<ServerException>()));
    });
  });
}

/// Create a test data
const tFlightOffer = FlightOffer(
  type: 'flight-offer',
  id: '1',
  source: 'GDS',
  instantTicketingRequired: false,
  nonHomogeneous: false,
  oneWay: false,
  lastTicketingDate: '2023-12-31',
  lastTicketingDateTime: '2023-12-31T23:59:59',
  numberOfBookableSeats: 5,
  itineraries: [
    Itineraries(duration: 'PT14H15M', segments: [
      Segments(
          departure: Departure(iataCode: 'NSI', at: '2024-01-02T11:35:00'),
          arrival: Arrival(iataCode: 'DUS', at: '2024-01-03T11:35:00'),
          carrierCode: 'PR',
          number: '212',
          aircraft: Aircraft(code: '333'),
          operating: Operating(carrierCode: 'PR'),
          duration: 'PT14H15M',
          id: '1',
          numberOfStops: 0,
          blacklistedInEU: false)
    ])
  ],
  price: Price(currency: 'Eur', total: '200.0', base: '150.0'),
  pricingOptions:
      PricingOptions(fareType: ['PUBLISHED'], includedCheckedBagsOnly: true),
  validatingAirlineCodes: ['PR'],
  travelers: [
    TravelerPricings(
        travelerId: '1',
        fareOption: 'STANDARD',
        travelerType: 'ADLUT',
        price: Price(currency: 'Eur', total: '200.0', base: '150.0'),
        fareDetailsBySegment: [
          FareDetailsBySegment(
              segmentId: '1',
              cabin: 'ECONOMY',
              fareBasis: 'EOBAU',
              classe: 'E',
              includedCheckedBags: IncludedCheckedBags(quantity: 55))
        ])
  ],
);
