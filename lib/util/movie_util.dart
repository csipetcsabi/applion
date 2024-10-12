import 'package:flutter/material.dart';

import '../features/movies/domain/entity/movie.dart';

class MovieUtil{

 static  String getPosterPath(Movie movie) {
    return "https://image.tmdb.org/t/p/w500${movie.posterPath}";
  }

  static getNetworkImage(Movie movie) {
    return FittedBox(
      child: Image.network(
        MovieUtil.getPosterPath(movie),
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.movie);
        },
      ),
    );
  }
}