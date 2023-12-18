import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([DataConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group("isConnected", () {
    test("should forward the call to DataConnectionChecker.hasConnection",
        () async {
      final tHastConnectionFuture = Future.value(true);
      // Arrange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHastConnectionFuture);

      // act
      final result = networkInfoImpl.isConnected;

      // assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHastConnectionFuture);
    });
  });
}
