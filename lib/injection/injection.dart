import 'package:applion/features/movies/data/repository/movie_repository_impl.dart';
import 'package:applion/features/movies/domain/use_case/fetch_movie_usecase.dart';
import 'package:get_it/get_it.dart';

import '../features/movies/domain/repository/movie_repository.dart';
import '../features/movies/presentation/bloc/movies_bloc.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());
  getIt.registerLazySingleton<FetchMoviesUseCase>(
      () => FetchMoviesUseCase(getIt<MovieRepository>()));
  getIt.registerFactory(() => MoviesBloc(getIt<FetchMoviesUseCase>()));

}
