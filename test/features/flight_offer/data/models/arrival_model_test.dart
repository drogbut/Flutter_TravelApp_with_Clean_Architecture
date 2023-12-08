import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival_model.dart';
import 'package:travel_app/features/flight_offer/domain/entities/arrival.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  /// Define a model objet
  const tArrivalModel =
      ArrivalModel(iataCode: "MNL", at: "2021-11-01T16:50:00");

  group('Arrival model test', () {
    /// (1) instance test
    test("Should be a subclass of Arrival entity", () async {
      expect(tArrivalModel, isA<Arrival>());
    });

    /// (2) fromJson test
    test("Should return a valid model when the fromJson correct adjust",
        () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('arrival.json'));

      // act
      final result = ArrivalModel.fromJson(jsonMap);

      // expect
      expect(result, tArrivalModel);
    });

    /// (3) toJson test
    test('Should convert ArrivalModel to JSON', () {
      // act
      final jsonResult = tArrivalModel.toJson();

      // expect
      expect(jsonResult['iataCode'], 'MNL');
      expect(jsonResult['at'], '2021-11-01T16:50:00');
    });
  });
}
