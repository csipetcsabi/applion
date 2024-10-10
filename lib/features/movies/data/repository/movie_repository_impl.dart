import 'dart:convert';

import '../../../../app/app_constants.dart';
import '../../domain/entity/Movie.dart';
import '../../domain/repository/movie_repository.dart';

import '../data_source/remote_movie_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  RemoteMovieService remoteMovieService;

  MovieRepositoryImpl(this.remoteMovieService);

  @override
  Future<List<Movie>> getMovies({String? query}) async {
    return await remoteMovieService.fetchTMDBMovies(query: query);
  }
}
