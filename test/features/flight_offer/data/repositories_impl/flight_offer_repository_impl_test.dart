import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/core/errors/exceptions.dart';
import 'package:travel_app/core/errors/failure.dart';
import 'package:travel_app/core/network/network_info.dart';
import 'package:travel_app/features/flight_offer/data/data_sources/flight_offer_local_data_source.dart';
import 'package:travel_app/features/flight_offer/data/data_sources/flight_offer_remote_data_source.dart';
import 'package:travel_app/features/flight_offer/data/models/aircraft_model.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival_model.dart';
import 'package:travel_app/features/flight_offer/data/models/departure_model.dart';
import 'package:travel_app/features/flight_offer/data/models/fare_details_by_segment_model.dart';
import 'package:travel_app/features/flight_offer/data/models/flight_offer_model.dart';
import 'package:travel_app/features/flight_offer/data/models/included_checked_bags_model.dart';
import 'package:travel_app/features/flight_offer/data/models/itineraries_model.dart';
import 'package:travel_app/features/flight_offer/data/models/operating_model.dart';
import 'package:travel_app/features/flight_offer/data/models/price_model.dart';
import 'package:travel_app/features/flight_offer/data/models/pricing_options_model.dart';
import 'package:travel_app/features/flight_offer/data/models/segments_model.dart';
import 'package:travel_app/features/flight_offer/data/models/traveler_pricings_model.dart';
import 'package:travel_app/features/flight_offer/data/repositories_impl/flight_offer_repository_impl.dart';
import 'package:travel_app/features/flight_offer/domain/entities/flight_offer.dart';

import 'flight_offer_repository_impl_test.mocks.dart';

@GenerateMocks([
  FlightOfferRepositoryImpl,
  FlightOfferRemoteDataSource,
  FlightOfferLocalDataSource,
  NetworkInfo
])
void main() {
  late FlightOfferRepositoryImpl repository;
  late FlightOfferRemoteDataSource mockRemoteDataSource;
  late FlightOfferLocalDataSource mockLocalDataSource;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockFlightOfferRemoteDataSource();
    mockLocalDataSource = MockFlightOfferLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = FlightOfferRepositoryImpl(
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
            adults: 'ADULT'))
        .thenAnswer((_) async => tFlightOfferModel);

    // act
    await repository.getAvailableFlights(
        "NSI", "DUS", "2024-01-02T11:35:00", "ADULT");

    // assert
    verify(mockNetworkInfo.isConnected).called(1);
  });

  group("Device is online", () {
    const FlightOffer tFlightOffer = tFlightOfferModel;

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
              adults: "ADULT"))
          .thenAnswer((_) async => tFlightOfferModel);

      // act
      final result = await repository.getAvailableFlights(
          "NSI", "DUS", "2024-01-02T11:35:00", "ADULT");

      // assert
      verify(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              adults: "ADULT"))
          .called(1);
      expect(result, equals(const Right(tFlightOffer)));
    });

    test("should cached data when the call to remote is successful", () async {
      // arrange
      when(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              adults: "ADULT"))
          .thenAnswer((_) async => tFlightOfferModel);

      // act
      await repository.getAvailableFlights(
          "NSI", "DUS", "2024-01-02T11:35:00", "ADULT");

      // assert
      verify(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              adults: "ADULT"))
          .called(1);
      verify(mockLocalDataSource.cacheAvailableFlights(tFlightOfferModel));
    });

    test(
        "should return server exception when the call to remote is unsuccessful",
        () async {
      // arrange
      when(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              adults: "ADULT"))
          .thenThrow(ServerException());

      // act
      final result = await repository.getAvailableFlights(
          "NSI", "DUS", "2024-01-02T11:35:00", "ADULT");

      // assert
      verify(mockRemoteDataSource.getAvailableFlights(
              originLocationCode: "NSI",
              destinationLocationCode: "DUS",
              departureDate: "2024-01-02T11:35:00",
              adults: "ADULT"))
          .called(1);
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group("Device is offline", () {
    const FlightOffer tFlightOffer = tFlightOfferModel;

    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
        "should return last locally cached data when the cached data is present",
        () async {
      // arrange
      when(mockLocalDataSource.getLastAvailableFlights())
          .thenAnswer((_) async => tFlightOfferModel);

      // act
      final result = await repository.getAvailableFlights(
          "NSI", "DUS", "2024-01-02T11:35:00", "ADULT");

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
      final result = await repository.getAvailableFlights(
          "NSI", "DUS", "2024-01-02T11:35:00", "ADULT");

      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastAvailableFlights());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}

/// Create a test data
const tFlightOfferModel = FlightOfferModel(
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
    ItinerariesModel(duration: 'PT14H15M', segments: [
      SegmentsModel(
          departure: DepartureModel(iataCode: 'NSI', at: '2024-01-02T11:35:00'),
          arrival: ArrivalModel(iataCode: 'DUS', at: '2024-01-03T11:35:00'),
          carrierCode: 'PR',
          number: '212',
          aircraft: AircraftModel(code: '333'),
          operating: OperatingModel(carrierCode: 'PR'),
          duration: 'PT14H15M',
          id: '1',
          numberOfStops: 0,
          blacklistedInEU: false)
    ])
  ],
  price: PriceModel(currency: 'Eur', total: '200.0', base: '150.0'),
  pricingOptions: PricingOptionsModel(
      fareType: ['PUBLISHED'], includedCheckedBagsOnly: true),
  validatingAirlineCodes: ['PR'],
  travelerPricings: [
    TravelerPricingsModel(
        travelerId: '1',
        fareOption: 'STANDARD',
        travelerType: 'ADLUT',
        price: PriceModel(currency: 'Eur', total: '200.0', base: '150.0'),
        fareDetailsBySegment: [
          FareDetailsBySegmentModel(
              segmentId: '1',
              cabin: 'ECONOMY',
              fareBasis: 'EOBAU',
              classe: 'E',
              includedCheckedBags: IncludedCheckedBagsModel(quantity: 55))
        ])
  ],
);
