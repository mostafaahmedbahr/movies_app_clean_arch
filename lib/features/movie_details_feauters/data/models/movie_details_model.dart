import 'package:movies_app_clean_arch/features/movie_details_feauters/data/models/geners_model.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';

class MovieDetailsModel extends MovieDetailsEntities {
  MovieDetailsModel({required super.id,
    required super.backdropPath,
    required super.title,
    required super.posterPath,
    required super.overview,
    required super.releaseDate,
    required super.voteCount,
    required super.voteAverage,
    required super.runTime,
    required super.genres});


  factory MovieDetailsModel.fromJson(Map<String, dynamic> json)=>
      MovieDetailsModel(
          id: json['id'],
          backdropPath: json['backdrop_path'],
          title: json['title'],
          posterPath: json['poster_path'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          voteCount: json['vote_count'],
          voteAverage: json['vote_average'],
          runTime: json['runtime'],
          genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
      );
}
