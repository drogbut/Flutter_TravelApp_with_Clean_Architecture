import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/core/presentation/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group("stringToUnsignedInt", () {
    test(
      "Should return an integer when the string represents an unsigned integer and does not exceed 9",
      () async {
        // arrange
        const str = '2';

        // act
        final result = inputConverter.stringToInteger(str);

        // assert
        expect(result, const Right(2));
      },
    );

    test(
      "Should return a failure when the string isn't an integer",
      () async {
        // arrange
        const str = 'abd';

        // act
        final result = inputConverter.stringToInteger(str);

        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      "Should return a failure when the string is a negative integer",
      () async {
        // arrange
        const str = '-123';

        // act
        final result = inputConverter.stringToInteger(str);

        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      "Should return a failure when the string is an integer exceeding 9",
      () async {
        // arrange
        const str = '10';

        // act
        final result = inputConverter.stringToInteger(str);

        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      "Should return a failure when the string is empty",
      () async {
        // arrange
        const str = '';

        // act
        final result = inputConverter.stringToInteger(str);

        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      "Should return a failure when the string has more than one character and starts with '0'",
      () async {
        // arrange
        const str = '01';

        // act
        final result = inputConverter.stringToInteger(str);

        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
