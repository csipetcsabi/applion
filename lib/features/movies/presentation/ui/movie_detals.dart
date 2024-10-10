import 'package:applion/features/movies/domain/entity/movie.dart';
import 'package:flutter/material.dart';

import '../../../../util/movie_util.dart';

class MovieDetails extends StatelessWidget {
  Movie movie;

  MovieDetails(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.network(
          MovieUtil.getPosterPath(movie),
        ),
        Container(
          child: Center(
            child: Text(movie.title ?? "title"),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    ));
  }
}
