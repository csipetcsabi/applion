import 'package:applion/features/movies/domain/use_case/fetch_movie_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection/injection.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../domain/repository/movie_repository.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final FetchMoviesUseCase fetchMoviesUseCase;
  MoviesBloc(this.fetchMoviesUseCase) : super(MoviesStateInitial()) {
    on<MoviesEventFetch>((event, emit) async {
      emit(MoviesStateLoading());
      try {
        final movies = await fetchMoviesUseCase(query: event.query);
        emit(MoviesStateLoaded(movies));
      } catch (e) {
        emit(MoviesStateError('Error fetching movies'));
      }
    });
  }


}
