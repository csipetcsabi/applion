import '../entity/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({String? query});
}
