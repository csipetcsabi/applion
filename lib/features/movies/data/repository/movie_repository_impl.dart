import 'dart:convert';

import '../../../../app/app_constants.dart';
import '../../domain/entity/Movie.dart';
import '../../domain/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<List<Movie>> getMovies() async {
    return await fetchTMDBMovies();

    /*   await Future.delayed(const Duration(seconds: 2));
    return [
      Movie(id: 1, title: 'Movie 1', details: 'Details1'),
      Movie(id: 2, title: 'Movie 2', details: 'Details2'),
    ];*/
  }

  Future<List<Movie>> fetchTMDBMovies() async {
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}/search/movie?api_key=${AppConstants.apiKey}&query=avenger'));

    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body)['results'];
      return results
          .map((movie) => Movie(
                id: movie['id'],
                title: movie['title'],
                overview: movie['overview'],
                posterPath: movie['poster_path'],
                originalLanguage: movie['original_language'],
                popularity: movie['popularity'].toDouble(),
                voteCount: movie['vote_count'],
                voteAverage: movie['vote_average'].toDouble(),
              ))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
