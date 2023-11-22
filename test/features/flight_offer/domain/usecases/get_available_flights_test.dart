import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/core/errors/failures/failure.dart';
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
import 'package:travel_app/features/flight_offer/domain/repositories/flight_offer_repository.dart';
import 'package:travel_app/features/flight_offer/domain/usecases/get_avaible_flights.dart';

import 'get_available_flights_test.mocks.dart';

/// (2) Configuring the test group and initialisation
@GenerateMocks([FlightOfferRepository])
void main() {
  late GetAvailableFlights getAvailableFlights;
  late MockFlightOfferRepository mockRepository;

  group('GetAvailableFlights', () {
    setUp(() {
      mockRepository = MockFlightOfferRepository();
      getAvailableFlights = GetAvailableFlights(mockRepository);
    });

    /// (3) If negative test - Handling an exception
    test('should return a ServerFailure when an exception occurs', () async {
      // Arrange
      when(mockRepository.getAvailableFlights()).thenAnswer(
          (_) async => Left(ServerFailure(errorMessage: "An error occurred")));

      // Act
      final result = await getAvailableFlights.call();

      // Assert
      expect(result, isA<Left<Failure, FlightOffer>>());
      expect(
        result.fold(
          (failure) => failure,
          (flightOffer) => null,
        ),
        isA<ServerFailure>(),
      );
      verify(mockRepository.getAvailableFlights()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    // Test positif
    test('should return a FlightOffer when the call is successful', () async {
      // Arrange
      // Configurez le mock pour renvoyer une valeur attendue
      const expectedFlightOffer = flightOffer; // Utilisez vos données de test
      when(mockRepository.getAvailableFlights()).thenAnswer(
        (_) async => const Right(expectedFlightOffer),
      );

      // Act
      final result = await getAvailableFlights.call();

      // Assert
      // Vérifiez que le résultat est du type Right<Failure, FlightOffer>
      expect(result, isA<Right<Failure, FlightOffer>>());

      // Vous pouvez également vérifier que les données renvoyées sont celles attendues
      result.fold(
        (failure) => fail('Expected Right, but got Left: $failure'),
        (flightOffer) {
          expect(flightOffer, equals(expectedFlightOffer));
        },
      );

      // Vérifiez que la méthode mockée a été appelée comme prévu
      verify(mockRepository.getAvailableFlights()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}

/// (3) Create a test data
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
  itineraries: Itineraries(
      duration: 'PT14H15M',
      segments: Segments(
          departure: Departure(
              iataCode: 'SYD', terminal: '1', at: '2021-11-01T11:35:00'),
          arrival: Arrival(
              iataCode: 'MNL', terminal: '2', at: '2021-11-01T11:35:00'),
          carrierCode: 'PR',
          number: '212',
          aircraft: Aircraft(code: '333'),
          operating: Operating(carrierCode: 'PR'),
          duration: 'PT14H15M',
          id: '1',
          numberOfStops: 0,
          blacklistedInEU: false)),
  price: Price(currency: 'Eur', total: 200.0, base: 150.0),
  pricingOptions:
      PricingOptions(fareType: 'PUBLISHED', includedCheckedBagsOnly: true),
  validatingAirlineCodes: 'PR',
  travelerPricings: TravelerPricings(
      travelerId: '1',
      fareOption: 'STANDARD',
      travelerType: 'ADLUT',
      price: Price(currency: 'Eur', total: 200.0, base: 150.0),
      fareDetailsBySegment: FareDetailsBySegment(
          segmentId: '1',
          cabin: 'ECONOMY',
          fareBasis: 'EOBAU',
          classe: 'E',
          includedCheckedBags: IncludedCheckedBags(weight: 25, weightUnit: 0))),
);
