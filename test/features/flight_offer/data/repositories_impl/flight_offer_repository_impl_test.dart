import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/core/errors/exceptions.dart';
import 'package:travel_app/core/errors/failure.dart';
import 'package:travel_app/core/network/network_info.dart';
import 'package:travel_app/features/flight_offer/data/data_sources/flight_offer_local_data_source.dart';
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
import 'package:travel_app/features/flight_offer/data/repositories_impl/amadeus_repository_impl.dart';

import 'flight_offer_repository_impl_test.mocks.dart';

@GenerateMocks([
  AmadeusRepositoryImpl,
  FlightOfferRemoteDataSource,
  FlightOfferLocalDataSource,
  NetworkInfo
])
void main() {
  late AmadeusRepositoryImpl repository;
  late FlightOfferRemoteDataSource mockRemoteDataSource;
  late FlightOfferLocalDataSource mockLocalDataSource;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockFlightOfferRemoteDataSource();
    mockLocalDataSource = MockFlightOfferLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = AmadeusRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  test("should check if the device is online", () async {
    // arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    // configure the mock
    when(mockRemoteDataSource.getAvailableFlights(
            originLocationCode: 'NSI',
            destinationLocationCode: 'DUS',
            departureDate: '2024-01-02T11:35:00',
            numberOfPassengers: '1'))
        .thenAnswer((_) async => flightOffer);

    // act
    await repository.getFlightOffersSearch(
        "NSI", "DUS", "2024-01-02T11:35:00", "1");

    // assert
    verify(mockNetworkInfo.isConnected).called(1);
  });

  group("Device is online", () {
    const tFlightOffer = flightOffer;

    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test("should return remote data when the call to remote is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              numberOfPassengers: "1"))
          .thenAnswer((_) async => tFlightOffer);

      // act
      final result = await repository.getFlightOffersSearch(
          "NSI", "DUS", "2024-01-02T11:35:00", "1");

      // assert
      verify(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              numberOfPassengers: "1"))
          .called(1);
      expect(result, equals(const Right(tFlightOffer)));
    });

    test("should cached data when the call to remote is successful", () async {
      // arrange
      when(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              numberOfPassengers: "1"))
          .thenAnswer((_) async => tFlightOffer);

      // act
      await repository.getFlightOffersSearch(
          "NSI", "DUS", "2024-01-02T11:35:00", "1");

      // assert
      verify(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              numberOfPassengers: "1"))
          .called(1);
      verify(mockLocalDataSource.cacheAvailableFlights(tFlightOffer));
    });

    test(
        "should return server exception when the call to remote is unsuccessful",
        () async {
      // arrange
      when(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              numberOfPassengers: "1"))
          .thenThrow(ServerException());

      // act
      final result = await repository.getFlightOffersSearch(
          "NSI", "DUS", "2024-01-02T11:35:00", "1");

      // assert
      verify(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              numberOfPassengers: "1"))
          .called(1);
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group("Device is offline", () {
    const FlightOffer tFlightOffer = flightOffer;

    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
        "should return last locally cached data when the cached data is present",
        () async {
      // arrange
      when(mockLocalDataSource.getLastAvailableFlights())
          .thenAnswer((_) async => tFlightOffer);

      // act
      final result = await repository.getFlightOffersSearch(
          "NSI", "DUS", "2024-01-02T11:35:00", "1");

      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastAvailableFlights());
      expect(result, equals(const Right(tFlightOffer)));
    });

    test("should return cacheFailure when the isn't cached data present",
        () async {
      // arrange
      when(mockLocalDataSource.getLastAvailableFlights())
          .thenThrow(CacheException());

      // act
      final result = await repository.getFlightOffersSearch(
          "NSI", "DUS", "2024-01-02T11:35:00", "1");

      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastAvailableFlights());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}

/// Create a test data
const flightOffer = FlightOffer(
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
