
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';

import '../data_source/remote_movie_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  RemoteMovieService remoteMovieService;
  final Box<Movie> movieBox;
  final String apiKey;

  MovieRepositoryImpl(this.remoteMovieService, this.movieBox, this.apiKey);

  @override
  Future<List<Movie>> getMovies({required String query }) async {
    try {
      final movies = await remoteMovieService.searchMovies( apiKey,query, 1, 'en-US');
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
