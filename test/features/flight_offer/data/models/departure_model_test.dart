import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/features/flight_offer/data/models/departure_model.dart';
import 'package:travel_app/features/flight_offer/domain/entities/departure.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  /// Define a model objet
  const tDepartureModel =
      DepartureModel(iataCode: "SYD", at: "2021-11-01T11:35:00");

  group('Departure model test', () {
    /// (1) instance test
    test("Should be a subclass of Departure entity", () async {
      expect(tDepartureModel, isA<Departure>());
    });

    /// (2) fromJson test
    test("Should return a valid model when the fromJson correct adjust",
        () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('departure.json'));

      // act
      final result = DepartureModel.fromJson(jsonMap);

      // expect
      expect(result, tDepartureModel);
    });

    /// (3) toJson test
    test('Should convert ArrivalModel to JSON', () {
      // act
      final jsonResult = tDepartureModel.toJson();

      // expect
      expect(jsonResult['iataCode'], 'SYD');
      expect(jsonResult['at'], '2021-11-01T11:35:00');
    });
  });
}
