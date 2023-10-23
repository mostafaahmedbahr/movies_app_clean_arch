import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/recommendation_entity.dart';

class RecommendationMoviesModel extends RecommendationEntity {
  RecommendationMoviesModel(
      {required super.image, required super.title, required super.id});

  factory RecommendationMoviesModel.fromJson(Map<String, dynamic> json) =>
      RecommendationMoviesModel(
          image: json["backdrop_path"],
          title: json["title"],
          id:  json["id"],
      );
}
