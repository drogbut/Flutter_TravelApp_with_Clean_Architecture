import 'package:dartz/dartz.dart';
import 'package:travel_app/core/errors/exceptions.dart';
import 'package:travel_app/core/errors/failure.dart';
import 'package:travel_app/core/network/network_info.dart';
import 'package:travel_app/features/flight_offer/domain/repositories/flight_offer_repository.dart';

import '../data_sources/flight_offer_local_data_source.dart';
import '../data_sources/flight_offer_remote_data_source.dart';
import '../models/flight_offer/flight_offer.dart';

class FlightOfferRepositoryImpl extends FlightOfferRepository {
  final FlightOfferRemoteDataSource remoteDataSource;
  final FlightOfferLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FlightOfferRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, FlightOffer>> getAvailableFlights(
      String? originLocationCode,
      String? destinationLocationCode,
      String? departureDate,
      String? numberOfPassengers) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getAvailableFlights(
          originLocationCode: originLocationCode,
          destinationLocationCode: destinationLocationCode,
          departureDate: departureDate,
          numberOfPassengers: numberOfPassengers,
        );

        localDataSource.cacheAvailableFlights(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localData = await localDataSource.getLastAvailableFlights();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
