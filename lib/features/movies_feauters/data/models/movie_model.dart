import 'package:movies_app_clean_arch/features/movies_feauters/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({required super.movieEntityId,
    required super.movieEntityBackdropPath,
    required super.movieEntityOriginalTitle,
    required super.movieEntityGenreIds,
    required super.movieEntityOverview,
    required super.movieEntityReleaseDate,
    required super.movieEntityVoteAverage,
    required super.movieEntityVoteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(
          movieEntityId: json['id'],
          movieEntityBackdropPath: json['backdrop_path'],
          movieEntityOriginalTitle:json['original_title'],
          //movieEntityGenreIds: json['genre_ids'].cast<int>(),
          movieEntityGenreIds: List<int>.from(json['genre_ids'].map((e) => e)),
          movieEntityOverview:  json['overview'],
          movieEntityReleaseDate: json['release_date'],
          movieEntityVoteAverage: json['vote_average'],
          movieEntityVoteCount: json['vote_count'],
      );
}
