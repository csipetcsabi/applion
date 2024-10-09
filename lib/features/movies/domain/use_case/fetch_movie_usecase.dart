import '../entity/Movie.dart';
import '../repository/movie_repository.dart';

class FetchMoviesUseCase   {
  final MovieRepository movieRepository;

  FetchMoviesUseCase(this.movieRepository);

  @override
  Future<List<Movie>> call({String? query}) {
    return movieRepository.getMovies(query: query);
  }
}