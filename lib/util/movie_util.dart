import '../features/movies/domain/entity/Movie.dart';

class MovieUtil{

 static  String getPosterPath(Movie movie) {
    return "https://image.tmdb.org/t/p/w500${movie.posterPath}";
  }
}