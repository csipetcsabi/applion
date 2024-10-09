class Movie {
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final double? popularity;
  final int? voteCount;
  final String? originalLanguage;
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
