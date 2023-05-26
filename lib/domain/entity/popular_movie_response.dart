import 'package:json_annotation/json_annotation.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_widget.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularMovieResponse {
  final int page;
  @JsonKey(
    name: 'results',
  )
  final List<Movie> movies;
  final int totalResults;
  final int totalPages;

  PopularMovieResponse({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieResponseFromJson(this);
}
