import 'package:applion/config/hive_manager.dart';
import 'package:applion/features/movies/domain/use_case/fetch_movie_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final FetchMoviesUseCase fetchMoviesUseCase;
  String query = '';

  MoviesBloc(this.fetchMoviesUseCase) : super(MoviesStateInitial()) {
    on<MoviesEventFetch>((event, emit) async {
      query = event.query;
      emit(MoviesStateLoading());
      await fetchMovie(emit);
    });

    on<MoviesEventChangeLanguage>((event, emit) async {
      await preferencesBox.put(PrefConstants.language, event.language);
      await fetchMovie(emit);
    });
  }

  Future<void> fetchMovie(Emitter<MoviesState> emit) async {
    try {
      final movies = await fetchMoviesUseCase(query: query);
      emit(MoviesStateLoaded(movies));
    } catch (e) {
      emit(MoviesStateError('Error fetching movies'));
    }
  }
}
