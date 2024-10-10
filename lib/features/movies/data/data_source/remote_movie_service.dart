// lib/data/datasources/remote/movie_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../app/app_constants.dart';
import '../../domain/entity/Movie.dart';

class RemoteMovieService {


  Future<List<Movie>> fetchTMDBMovies({String? query}) async {
    String queryParam = query != null ? '&query=$query' : '';
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}/search/movie?api_key=${AppConstants.apiKey}$queryParam'));

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
