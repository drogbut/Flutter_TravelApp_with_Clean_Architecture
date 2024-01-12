import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

/// The [InputConverter] class provides methods for converting strings to
/// unsigned integers.
class InputConverter {
  /// Converts a string to an unsigned integer.
  ///
  /// Returns [Right] containing the integer if the conversion succeeds, or
  /// [Left] containing an [InvalidInputFailure].
  ///
  /// Throws a [FormatException] if the string cannot be converted to an
  /// unsigned integer.
  ///
  /// - [str]: The string to convert.
  /// - Returns [Either] with [Right] containing the integer or [Left]
  ///   containing an [InvalidInputFailure].
  Either<Failure, int> stringToInteger(String str) {
    try {
      // Checks if the result is less than 0 or greater than 9,
      // which is considered invalid input for an unsigned integer.
      if (str.isEmpty) throw const FormatException();
      if (str.length > 1 && str.startsWith('0')) throw const FormatException();

      int result = int.parse(str);

      if (result < 1 || result > 9) throw const FormatException();

      // Conversion succeeds, returns Right with the integer.
      return Right(result);
    } on FormatException {
      // Conversion fails due to a FormatException, returns Left with an InvalidInputFailure.
      return Left(InvalidInputFailure());
    }
  }
}

/// Represents an invalid input error during conversion.
class InvalidInputFailure extends Failure {}
