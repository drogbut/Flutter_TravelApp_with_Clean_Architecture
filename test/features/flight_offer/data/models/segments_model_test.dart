import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/features/flight_offer/data/models/aircraft_model.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival_model.dart';
import 'package:travel_app/features/flight_offer/data/models/departure_model.dart';
import 'package:travel_app/features/flight_offer/data/models/operating_model.dart';
import 'package:travel_app/features/flight_offer/data/models/segments_model.dart';
import 'package:travel_app/features/flight_offer/domain/entities/segments.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  /// Define a model objet
  const tSegmentsModel = SegmentsModel(
      departure: DepartureModel(iataCode: "SYD", at: "2021-11-01T11:35:00"),
      arrival: ArrivalModel(iataCode: "MNL", at: "2021-11-01T16:50:00"),
      aircraft: AircraftModel(code: "333"),
      id: "1",
      blacklistedInEU: false,
      operating: OperatingModel(carrierCode: "PR"),
      numberOfStops: 0);

  group("Segments model test", () {
    /// (1) instance test
    test("Should be a subclass of Segments entity", () async {
      expect(tSegmentsModel, isA<Segments>());
    });
  });

  /// (2) fromJson test
  test('Should create SegmentsModel from JSON', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('segments.json'));

    // act
    final result = SegmentsModel.fromJson(jsonMap);

    // expect
    expect(result, tSegmentsModel);
  });

  /// (3) toJson test
  test('Should convert SegmentsModel to JSON', () {
    // act
    final jsonResult = tSegmentsModel.toJson();

    // expect
    expect(jsonResult['id'], '1');
    expect(jsonResult['departure'].iataCode, 'SYD');
    expect(jsonResult['departure'].at, '2021-11-01T11:35:00');
    expect(jsonResult['arrival'].iataCode, 'MNL');
    expect(jsonResult['blacklistedInEU'], false);
  });
}
