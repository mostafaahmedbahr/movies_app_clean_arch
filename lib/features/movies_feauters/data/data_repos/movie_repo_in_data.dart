import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch/core/errors/error_class.dart';
import 'package:movies_app_clean_arch/core/nerwork/excption.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/data/data_sources/movies_local_data_source.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/entities/movie_entity.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/repos/base_movie_repo.dart';

class MovieRepoImplementation extends BaseMovieRepo
{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  final BaseMovieLocalDataSource baseMovieLocalDataSource;

  MovieRepoImplementation({required this.baseMovieRemoteDataSource, required this.baseMovieLocalDataSource});

  @override
  Future<Either<Errors, List<MovieEntity>>> fetchPlayingNowMovie()async {
    try{
      var  result = await baseMovieRemoteDataSource.fetchPlayingNowMovieInRemoteDataSource();
      return right(result);
    }
   on ServerError catch(error)
    {
      return left(NetworkError(error.networkErrorModel.statusMsg));
    }

  }

  @override
  Future<Either<Errors, List<MovieEntity>>> fetchPopularMovies() async{
    try{
      var  result = await baseMovieRemoteDataSource.fetchPopularMoviesInRemoteDataSource();
      return right(result);
    }
    on ServerError catch(error)
    {
      return left(NetworkError(error.networkErrorModel.statusMsg));
    }
  }

  @override
  Future<Either<Errors, List<MovieEntity>>> fetchTopRatedMovies() async{
    try{
      var  result = await baseMovieRemoteDataSource.fetchTopRatedMoviesInRemoteDataSource();
      return right(result);
    }
    on ServerError catch(error)
    {
      return left(NetworkError(error.networkErrorModel.statusMsg));
    }
  }

}