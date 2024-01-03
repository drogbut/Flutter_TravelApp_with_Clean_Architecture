import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/core/errors/failure.dart';
import 'package:travel_app/core/usecase/usecase.dart';
import 'package:travel_app/features/flight_offer/domain/entities/aircraft.dart';
import 'package:travel_app/features/flight_offer/domain/entities/arrival.dart';
import 'package:travel_app/features/flight_offer/domain/entities/departure.dart';
import 'package:travel_app/features/flight_offer/domain/entities/fare_details_by_segment.dart';
import 'package:travel_app/features/flight_offer/domain/entities/flight_offer.dart';
import 'package:travel_app/features/flight_offer/domain/entities/included_checked_bags.dart';
import 'package:travel_app/features/flight_offer/domain/entities/itineraries.dart';
import 'package:travel_app/features/flight_offer/domain/entities/operating.dart';
import 'package:travel_app/features/flight_offer/domain/entities/price.dart';
import 'package:travel_app/features/flight_offer/domain/entities/pricing_options.dart';
import 'package:travel_app/features/flight_offer/domain/entities/segments.dart';
import 'package:travel_app/features/flight_offer/domain/entities/traveler_pricings.dart';
import 'package:travel_app/features/flight_offer/domain/repositories/flight_offer_repository.dart';
import 'package:travel_app/features/flight_offer/domain/usecases/get_avaible_flights.dart';

import 'get_available_flights_test.mocks.dart';

@GenerateMocks([FlightOfferRepository])
void main() {
  late GetAvailableFlights getAvailableFlights;
  late MockFlightOfferRepository mockRepository;

  group('GetAvailableFlights', () {
    setUp(() {
      mockRepository = MockFlightOfferRepository();
      getAvailableFlights = GetAvailableFlights(mockRepository);
    });

    const params = AvailableFlightParams(
      originLocationCode: 'NSI',
      destinationLocationCode: 'DUS',
      departureDate: '2024-01-02T11:35:00',
      adults: 'ADLUT',
    );

    /// If negative test
    test('should return a ServerFailure when an exception occurs', () async {
      // Arrange
      when(mockRepository.getAvailableFlights(
              'NSI', 'DUS', '2024-01-02T11:35:00', 'ADLUT'))
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await getAvailableFlights(params);

      // Assert
      expect(result, isA<Left<Failure, FlightOffer>>());

      verify(mockRepository.getAvailableFlights(
              'NSI', 'DUS', '2024-01-02T11:35:00', 'ADLUT'))
          .called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    /// Done Test
    test('should return a FlightOffer when the call is successful', () async {
      // Arrange
      const expectedFlightOffer = flightOffer;
      when(mockRepository.getAvailableFlights(
              'NSI', 'DUS', '2024-01-02T11:35:00', 'ADLUT'))
          .thenAnswer((_) async => const Right(expectedFlightOffer));

      // Act
      final result = await getAvailableFlights(params);

      // Assert
      expect(result, const Right(expectedFlightOffer));

      verify(mockRepository.getAvailableFlights(
              'NSI', 'DUS', '2024-01-02T11:35:00', 'ADLUT'))
          .called(1);
      verifyNoMoreInteractions(mockRepository);
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
