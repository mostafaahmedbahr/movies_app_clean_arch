import 'package:dio/dio.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/data/models/movie_details_model.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';

import '../../../../core/nerwork/excption.dart';
import '../../../../core/nerwork/network_error_model.dart';
import '../../../../core/utils/app_constance.dart';
import '../../domain/use_cases/fetch_movie_details_use_case.dart';

abstract class BaseMovieDetailsRemoteDataSource{

  Future<MovieDetailsEntities> fetchMovieDetailsInRemoteDataSource(MovieDetailsParams params);
  Future<MovieDetailsEntities> fetchRelatedMoviesInRemoteDataSource();

}


class MovieDetailsRemoteDataSourceImplementation extends BaseMovieDetailsRemoteDataSource{
  @override

  Future<MovieDetailsEntities> fetchMovieDetailsInRemoteDataSource(MovieDetailsParams params) async{
    var response =  await Dio().get("${AppConstance.baseUrl}/movie/${params.movieId}");
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);

    }else{
      return throw(ServerError( networkErrorModel: NetworkErrorModel.fromJson(response.data)));
    }
  }

  @override
  Future<MovieDetailsEntities> fetchRelatedMoviesInRemoteDataSource() {
    // TODO: implement fetchRelatedMoviesInRemoteDataSource
    throw UnimplementedError();
  }
}