import '../entity/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({required String query});
}
