import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures/failure.dart';

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
class Params extends Equatable {
  int? index;

  @override
  List<Object?> get props => [index];
}
