import 'package:applion/features/movies/domain/entity/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class Result {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  Result({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
