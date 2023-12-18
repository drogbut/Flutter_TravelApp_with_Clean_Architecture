import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/features/flight_offer/data/models/price_model.dart';
import 'package:travel_app/features/flight_offer/data/models/traveler_pricings_model.dart';
import 'package:travel_app/features/flight_offer/domain/entities/traveler_pricings.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  const travelerPricingsModel = TravelerPricingsModel(
    travelerId: '1',
    fareOption: 'STANDARD',
    travelerType: 'ADULT',
    price: PriceModel(currency: 'EUR', total: '355.34', base: '255.00'),
    fareDetailsBySegment: null,
  );

  group('Traveler pricing model test', () {
    /// (1) instance test
    test('Should create a valid TravelerPricingsModel instance', () async {
      expect(travelerPricingsModel, isA<TravelerPricings>());
    });

    /// (2) fromJson test
    test('Should create TravelerPricingsModel from JSON', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('traveler_pricings.json'));

      // act
      final result = TravelerPricingsModel.fromJson(jsonMap);

      // expect
      expect(result, travelerPricingsModel);
    });

    /// (3) toJson test
    test('Should convert TravelerPricingsModel to JSON', () {
      // act
      final jsonResult = travelerPricingsModel.toJson();

      // expect
      expect(jsonResult['travelerId'], '1');
      expect(jsonResult['fareOption'], 'STANDARD');
      expect(jsonResult['travelerType'], 'ADULT');
      expect(jsonResult['price'].currency, 'EUR');
    });
  });
}
