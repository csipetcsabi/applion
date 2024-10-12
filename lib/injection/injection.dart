import 'package:applion/app/app_constants.dart';
import 'package:applion/features/movies/data/repository/movie_repository_impl.dart';
import 'package:applion/features/movies/domain/use_case/fetch_movie_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../config/hive.dart';
import '../features/movies/data/data_source/remote_movie_service.dart';
import '../features/movies/domain/repository/movie_repository.dart';
import '../features/movies/presentation/bloc/movies_bloc.dart';

final getIt = GetIt.instance;

void getItSetup() {
  final dio = Dio();
  getIt.registerLazySingleton<RemoteMovieService>(
      () => RemoteMovieService(dio)); // Register RemoteMovieService

  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
      getIt<RemoteMovieService>(), movieBox, AppConstants.apiKey)); // Register MovieRepository
  getIt.registerLazySingleton<FetchMoviesUseCase>(
      () => FetchMoviesUseCase(getIt<MovieRepository>()));
  getIt.registerFactory(() => MoviesBloc(getIt<FetchMoviesUseCase>()));
}
