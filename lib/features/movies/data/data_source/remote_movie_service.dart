import 'package:applion/features/movies/domain/entity/result.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'remote_movie_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class RemoteMovieService {
  factory RemoteMovieService(Dio dio, {String baseUrl}) = _RemoteMovieService;

  @GET("/search/movie")
  Future<Result> searchMovies(
    @Query("api_key") String apiKey,
    @Query("query") String query,
    @Query("page") int? page,
    @Query("language") String? language,
  );
}
