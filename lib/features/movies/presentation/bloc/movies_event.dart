sealed class MoviesEvent {}

class MoviesEventFetch extends MoviesEvent {
  String query;

  MoviesEventFetch({required this.query});
}
