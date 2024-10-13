
import 'package:applion/app/app_language.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../config/hive_manager.dart';
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
      AppLanguage language = preferencesBox.get(PrefConstants.language, defaultValue: AppLanguage.en);

      final result = await remoteMovieService.searchMovies( apiKey,query, 1, language.name);
      await saveArticles(result.results);
      return result.results;
    } catch (e) {
      return movieBox.values.toList();
    }
  }

  Future<void> saveArticles(List<Movie> articles) async {
    await movieBox.clear();
    await movieBox.addAll(articles);
  }
}
