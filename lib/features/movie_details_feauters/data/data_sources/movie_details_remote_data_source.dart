import 'package:dio/dio.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/data/models/movie_details_model.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/data/models/recommendation_movies_model.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/recommendation_entity.dart';

import '../../../../core/nerwork/excption.dart';
import '../../../../core/nerwork/network_error_model.dart';
import '../../../../core/utils/app_constance.dart';
import '../../domain/use_cases/fetch_movie_details_use_case.dart';

abstract class BaseMovieDetailsRemoteDataSource{

  Future<MovieDetailsEntities> fetchMovieDetailsInRemoteDataSource(MovieDetailsParams params);
  Future<List<RecommendationEntity>> fetchRelatedMoviesInRemoteDataSource(MovieDetailsParams params);

}


class MovieDetailsRemoteDataSourceImplementation extends BaseMovieDetailsRemoteDataSource {
  @override
  Future<MovieDetailsEntities> fetchMovieDetailsInRemoteDataSource(
      MovieDetailsParams params) async {
    var response = await Dio().get(
        "${AppConstance.baseUrl}/movie/${params.movieId}?api_key=${AppConstance.apiKey}");
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      return throw(ServerError(
          networkErrorModel: NetworkErrorModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<RecommendationEntity>> fetchRelatedMoviesInRemoteDataSource(
      MovieDetailsParams params) async {
    var response = await Dio().get("${AppConstance.baseUrl}/movie/${params.movieId}/recommendations?api_key=${AppConstance.apiKey}");
    if (response.statusCode == 200) {
      return List<RecommendationMoviesModel>.from(
          (response.data["results"] as List).map((e) {
            return RecommendationMoviesModel.fromJson(e);
          }));
    } else {
      return throw(ServerError(
          networkErrorModel: NetworkErrorModel.fromJson(response.data)));
    }
  }
}