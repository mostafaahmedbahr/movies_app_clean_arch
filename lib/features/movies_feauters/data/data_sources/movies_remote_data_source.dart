import 'package:dio/dio.dart';
import 'package:movies_app_clean_arch/core/nerwork/network_error_model.dart';
import 'package:movies_app_clean_arch/core/utils/app_constance.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/data/models/movie_model.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/entities/movie_entity.dart';

import '../../../../core/nerwork/excption.dart';


abstract class BaseMovieRemoteDataSource {


  Future<List<MovieEntity>> fetchPlayingNowMovieInRemoteDataSource();
  Future<List<MovieEntity>> fetchPopularMoviesInRemoteDataSource();
  Future<List<MovieEntity>> fetchTopRatedMoviesInRemoteDataSource();

}


class  MovieRemoteDataSourceImplementation extends BaseMovieRemoteDataSource
{

  @override
  Future<List<MovieEntity>> fetchPlayingNowMovieInRemoteDataSource() async{
    var response =  await Dio().get(AppConstance.getNowPlayingUrl);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e){
        return MovieModel.fromJson(e);
      }));
    }else{
      return throw(ServerError( networkErrorModel: NetworkErrorModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<MovieEntity>> fetchPopularMoviesInRemoteDataSource() async{
    var response =  await Dio().get(AppConstance.getPopularUrl);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e){
        return MovieModel.fromJson(e);
      }));
    }else{
      return throw(ServerError( networkErrorModel: NetworkErrorModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMoviesInRemoteDataSource() async{
    var response =  await Dio().get(AppConstance.getTopRatedUrl);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e){
        return MovieModel.fromJson(e);
      }));
    }else{
      return throw(ServerError( networkErrorModel: NetworkErrorModel.fromJson(response.data)));
    }
  }

}