import '../entity/Movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({String? query});
}
