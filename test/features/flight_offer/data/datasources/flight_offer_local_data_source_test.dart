import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/errors/exceptions.dart';
import 'package:travel_app/features/flight_offer/data/datasources/flight_offer_local_data_source.dart';
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

import '../../../../fixtures/fixtures_reader.dart';
import 'flight_offer_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late FlightOfferLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = FlightOfferLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  group("getLastFlightOffer", () {
    final tFlightOfferModel = FlightOfferModel.fromJson(
        json.decode(fixture('flight_offer_cached.json')));

    test(
        "Should return a flightOffer from sharedPreferences when there is one in there cache",
        () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('flight_offer_cached.json'));

      // act
      final result = await dataSource.getLastAvailableFlights();

      // assert
      verify(mockSharedPreferences.getString('CACHED_FLIGHT_OFFER'));
      expect(result, equals(tFlightOfferModel));
    });

    test("Should throw a cachedException when there is not a cache value", () {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // act
      final call = dataSource.getLastAvailableFlights;

      // assert
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });

  group("cacheNumberTrivia", () {
    const tFlightOfferModel = flightOfferModel;
    final jsonToString = json.encode(tFlightOfferModel.toJson());
    test("should call sharedPreferences to cache data", () async {
      // arrange
      when(mockSharedPreferences.setString(CACHED_FLIGHT_OFFER, jsonToString))
          .thenAnswer((_) async => true);

      // act
      await dataSource.cacheAvailableFlights(tFlightOfferModel);

      // assert
      verify(
          mockSharedPreferences.setString(CACHED_FLIGHT_OFFER, jsonToString));
    });
  });
}

/// Create a test data
const flightOfferModel = FlightOfferModel(
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
