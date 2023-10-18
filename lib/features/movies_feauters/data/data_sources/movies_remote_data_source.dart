import 'package:dio/dio.dart';
import 'package:movies_app_clean_arch/core/utils/app_constance.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/data/models/movie_model.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/entities/movie_entity.dart';

abstract class BaseHomeRemoteDataSource {


  Future<List<MovieEntity>> fetchPlayingNowMovieInRemoteDataSource();
  Future<List<MovieEntity>> fetchPopularMoviesInRemoteDataSource();
  Future<List<MovieEntity>> fetchTopRatedMoviesInRemoteDataSource();

}


class  HomeRemoteDataSourceImplementation extends BaseHomeRemoteDataSource
{

  @override
  Future<List<MovieEntity>> fetchPlayingNowMovieInRemoteDataSource() async{
    var response =  await Dio().get("/movie/now_playing?api_key=${AppConstance.apiKey}");
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e){
        return MovieModel.fromJson(e);
      }));
    }else{
      return [];
    }
  }

  @override
  Future<List<MovieEntity>> fetchPopularMoviesInRemoteDataSource() {
    // TODO: implement fetchPopularMoviesInRemoteDataSource
    throw UnimplementedError();
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMoviesInRemoteDataSource() {
    // TODO: implement fetchTopRatedMoviesInRemoteDataSource
    throw UnimplementedError();
  }

}