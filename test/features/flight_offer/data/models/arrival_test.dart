import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/features/flight_offer/data/models/arrival/arrival.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  group('Arrival', () {
    test('fromJson', () {
      // Read the information in the arrival.json file
      final Map<String, dynamic> jsonMap = json.decode(fixture('arrival.json'));

      // Convert JSON to Arrival object
      final arrival = Arrival.fromJson(jsonMap);

      // Check that the values are correctly assigned
      expect(arrival.iataCode, 'MNL');
      expect(arrival.at, '2021-11-01T16:50:00');
    });

    test('toJson', () {
      // Create an instance of the Arrival class with specific values
      final arrival = Arrival(iataCode: 'MNL', at: '2021-11-01T16:50:00');

      // Serialise the instance in JSON
      final jsonString = json.encode(arrival.toJson());

      // expected JSON
      final expectedJson = '{"iataCode":"MNL","at":"2021-11-01T16:50:00"}';

      // Check that the generated JSON corresponds to the expected JSON
      expect(jsonString, expectedJson);
    });
  });
}
