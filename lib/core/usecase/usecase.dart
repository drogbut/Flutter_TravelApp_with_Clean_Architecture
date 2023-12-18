import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

/// Parameters have to be put into a container object so that they can be
/// included in this abstract base class method definition.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// This will be used by the code calling the use case whenever the use case
/// doesn't accept any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

/// This will be used by the code calling the use case whenever the use case
/// accept parameters.
class AvailableFlightParams extends Equatable {
  String? originLocationCode;
  String? destinationLocationCode;
  String? departureDate;
  String? adults;

  AvailableFlightParams(
      {required this.originLocationCode,
      required this.destinationLocationCode,
      required this.departureDate,
      required this.adults});

  @override
  List<Object?> get props =>
      [originLocationCode, destinationLocationCode, departureDate, adults];
}
