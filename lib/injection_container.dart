import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/network/network_info.dart';
import 'package:travel_app/core/presentation/input_converter.dart';
import 'package:travel_app/features/flight_offer/data/data_sources/flight_offer_local_data_source.dart';
import 'package:travel_app/features/flight_offer/data/repositories_impl/amadeus_repository_impl.dart';
import 'package:travel_app/features/flight_offer/domain/usecases/get_flight_offers_search.dart';
import 'package:travel_app/features/flight_offer/presentation/bloc/flight_offers_bloc.dart';

import 'features/flight_offer/data/data_sources/flight_offer_remote_data_source.dart';
import 'features/flight_offer/domain/repositories/amadeus_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// features - getAvailableFlight
  // (1) Bloc
  sl.registerFactory(
    () => FlightOffersBloc(
      getAvailableFlights: sl(),
      inputConverter: sl(),
    ),
  );

  // (2) use cases
  sl.registerLazySingleton(() => GetFlightOffersSearch(sl()));

  // (3) Repository
  sl.registerLazySingleton<AmadeusRepository>(
    () => AmadeusRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // (4) Data sources
  sl.registerLazySingleton<FlightOfferRemoteDataSource>(
      () => FlightOfferRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<FlightOfferLocalDataSource>(
      () => FlightOfferLocalDataSourceImpl(sharedPreferences: sl()));

  /// core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //sl.registerSingletonAsync(() async => SharedPreferences.getInstance());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
