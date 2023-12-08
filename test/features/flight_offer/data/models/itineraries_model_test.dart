import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/features/flight_offer/data/models/aircraft_model.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival_model.dart';
import 'package:travel_app/features/flight_offer/data/models/departure_model.dart';
import 'package:travel_app/features/flight_offer/data/models/itineraries_model.dart';
import 'package:travel_app/features/flight_offer/data/models/operating_model.dart';
import 'package:travel_app/features/flight_offer/data/models/segments_model.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  /// Define a model objet
  ///
  const tItinerariesModel = ItinerariesModel(
    duration: "PT14H15M",
    segments: [
      SegmentsModel(
          departure: DepartureModel(iataCode: "SYD", at: "2021-11-01T11:35:00"),
          arrival: ArrivalModel(iataCode: "MNL", at: "2021-11-01T16:50:00"),
          aircraft: AircraftModel(code: "333"),
          id: "1",
          blacklistedInEU: false,
          carrierCode: "PR",
          number: "212",
          duration: "PT8H15M",
          operating: OperatingModel(carrierCode: "PR"),
          numberOfStops: 0)
    ],
  );

  group("Itineraries model test", () {
    /// (1) instance test
    test("Should be a subclass of itineraries entity", () async {
      expect(tItinerariesModel, isA<ItinerariesModel>());
    });

    /// (2) fromJson test
    test('Should create itinerariesModel from JSON', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('itineraries.json'));

      // act
      final result = ItinerariesModel.fromJson(jsonMap);

      // expect
      expect(result, tItinerariesModel);
    });

    /// (3) toJson test
    test('Should convert itinerariesModel to JSON', () {
      // act
      final jsonResult = tItinerariesModel.toJson();

      // expect
      expect(jsonResult['duration'], 'PT14H15M');
    });
  });
}
