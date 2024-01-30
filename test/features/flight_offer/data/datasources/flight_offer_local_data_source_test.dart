import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/errors/exceptions.dart';
import 'package:travel_app/features/flight_offer/data/data_sources/flight_offer_local_data_source.dart';
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
    final tFlightOffer =
        FlightOffer.fromJson(json.decode(fixture('flight_offer_cached.json')));

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
      expect(result, equals(tFlightOffer));
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
    const tFlightOffer = flightOffer;
    final jsonToString = json.encode(tFlightOffer.toJson());
    test("should call sharedPreferences to cache data", () async {
      // arrange
      when(mockSharedPreferences.setString(cachedFlightOffer, jsonToString))
          .thenAnswer((_) async => true);

      // act
      await dataSource.cacheAvailableFlights(tFlightOffer);

      // assert
      verify(mockSharedPreferences.setString(cachedFlightOffer, jsonToString));
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
  travelerPricings: [
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
