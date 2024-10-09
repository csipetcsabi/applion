import '../../domain/entity/Movie.dart';
import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<List<Movie>> getMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Movie(id: 1, title: 'Movie 1', details: 'Details1'),
      Movie(id: 2, title: 'Movie 2', details: 'Details2'),
    ];
  }
}
