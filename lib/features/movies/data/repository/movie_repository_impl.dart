
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';

import '../data_source/remote_movie_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  RemoteMovieService remoteMovieService;
  final Box<Movie> movieBox;

  MovieRepositoryImpl(this.remoteMovieService, this.movieBox);

  @override
  Future<List<Movie>> getMovies({String? query}) async {
    try {
      final movies = await remoteMovieService.fetchTMDBMovies(query: query);
      await saveArticles(movies);
      return movies;
    } catch (e) {
      return movieBox.values.toList();
    }
  }

  Future<void> saveArticles(List<Movie> articles) async {
    await movieBox.clear();
    await movieBox.addAll(articles);
  }
}
