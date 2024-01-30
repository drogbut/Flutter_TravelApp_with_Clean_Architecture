import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/core/errors/failure.dart';
import 'package:travel_app/core/params/usecase.dart';
import 'package:travel_app/core/presentation/input_converter.dart';
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
import 'package:travel_app/features/flight_offer/domain/usecases/get_avaible_flights.dart';
import 'package:travel_app/features/flight_offer/presentation/bloc/flight_offers_bloc.dart';

import 'flight_offers_bloc_test.mocks.dart';

@GenerateMocks([GetAvailableFlights, InputConverter])
void main() {
  late FlightOffersBloc bloc;
  late MockGetAvailableFlights mockGetAvailableFlights;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetAvailableFlights = MockGetAvailableFlights();
    mockInputConverter = MockInputConverter();

    bloc = FlightOffersBloc(
      getAvailableFlights: mockGetAvailableFlights,
      inputConverter: mockInputConverter,
    );
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.state, equals(Empty()));
  });

  group('GetAvailableFlights', () {
    const tFlightOffers = flightOffer;
    const tNumberString = '1';
    final tNumberParsed = int.parse(tNumberString);

    void setUpMockInputConverterSuccess() =>
        when(mockInputConverter.stringToInteger(any))
            .thenReturn(Right(tNumberParsed));

    test('should convert the string to an unsigned integer', () async {
      // Arrange
      setUpMockInputConverterSuccess();

      // Act
      bloc.add(const SearchAvailableFlights(
        params: AvailableFlightParams(
          departure: 'NSI',
          arrival: 'DUS',
          departureDate: '2024-01-02',
          numberOfPassengers: '1',
        ),
      ));

      // Attendre que la méthode soit appelée
      await untilCalled(mockInputConverter.stringToInteger(any));

      // Assert
      verify(mockInputConverter.stringToInteger(tNumberString));
    });

    test('Should emit [Error] when the input is invalid', () async {
      // Arrange
      when(mockInputConverter.stringToInteger(any))
          .thenReturn(Left(InvalidInputFailure()));

      // Assert
      final expected = [
        const Error(message: invalidInputFailureMessage),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));

      // Act
      bloc.add(const SearchAvailableFlights(
        params: AvailableFlightParams(
          departure: 'NSI',
          arrival: 'DUS',
          departureDate: '2024-01-02T11:35:00',
          numberOfPassengers: '1',
        ),
      ));
    });

    test('Should get data from the available use case', () async {
      // Arrange
      setUpMockInputConverterSuccess();
      when(mockGetAvailableFlights(any))
          .thenAnswer((_) async => const Right(tFlightOffers));

      // Act
      bloc.add(const SearchAvailableFlights(
          params: AvailableFlightParams(
              departure: 'NSI',
              arrival: 'DUS',
              departureDate: '2024-01-02T11:35:00',
              numberOfPassengers: tNumberString)));
      await untilCalled(mockGetAvailableFlights(any));

      // Assert
      const params = AvailableFlightParams(
          departure: 'NSI',
          arrival: 'DUS',
          departureDate: '2024-01-02T11:35:00',
          numberOfPassengers: tNumberString);
      verify(mockGetAvailableFlights(params));
    });

    test('Should emit [Loading, Loaded] when data is gotten successful',
        () async {
      // Arrange
      setUpMockInputConverterSuccess();
      when(mockGetAvailableFlights(any))
          .thenAnswer((_) async => const Right(tFlightOffers));

      // Assert
      final expected = [
        //Empty(),
        Loading(),
        const Loaded(flightOffer: flightOffer),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(const SearchAvailableFlights(
          params: AvailableFlightParams(
              departure: 'NSI',
              arrival: 'DUS',
              departureDate: '2024-01-02T11:35:00',
              numberOfPassengers: tNumberString)));
    });

    test('should emit [Loading, Error] when getting data fails', () async {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetAvailableFlights(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expected = [
        //Empty(),
        Loading(),
        const Error(message: serverFailureMessage),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const SearchAvailableFlights(
          params: AvailableFlightParams(
              departure: 'NSI',
              arrival: 'DUS',
              departureDate: '2024-01-02T11:35:00',
              numberOfPassengers: tNumberString)));
    });

    test(
      'should emit [Loading, Error] with a proper message for the error',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetAvailableFlights(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Loading(),
          const Error(message: cacheFailureMessage),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        // act
        bloc.add(const SearchAvailableFlights(
            params: AvailableFlightParams(
                departure: 'NSI',
                arrival: 'DUS',
                departureDate: '2024-01-02T11:35:00',
                numberOfPassengers: tNumberString)));
      },
    );
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
