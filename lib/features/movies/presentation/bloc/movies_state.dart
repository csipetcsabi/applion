import '../../domain/entity/movie.dart';

sealed class MoviesState {}

class MoviesStateInitial extends MoviesState {}

class MoviesStateLoading extends MoviesState {}

class MoviesStateLoaded extends MoviesState {
  final List<Movie> movies;

  MoviesStateLoaded(this.movies);
}

class MoviesStateError extends MoviesState {
  final String message;

  MoviesStateError(this.message);
}
