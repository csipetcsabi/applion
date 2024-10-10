import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? overview;
  @HiveField(3)
  final String? posterPath;
  @HiveField(4)
  final double? popularity;
  @HiveField(5)
  final int? voteCount;
  @HiveField(6)
  final String? originalLanguage;
  @HiveField(7)
  final double? voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.voteCount,
    required this.originalLanguage,
    required this.voteAverage,
  });
}
