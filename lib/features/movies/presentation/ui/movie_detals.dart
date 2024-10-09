import 'package:applion/features/movies/domain/entity/Movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {

  Movie movie;
   MovieDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: Center(child: Text(movie.title ?? "title"),),));
  }
}