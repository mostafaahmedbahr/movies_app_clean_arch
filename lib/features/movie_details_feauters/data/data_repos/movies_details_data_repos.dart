import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch/core/errors/error_class.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/repos/get_movie_details_repos.dart';

import '../../../../core/nerwork/excption.dart';
import '../../domain/use_cases/fetch_movie_details_use_case.dart';
import '../data_sources/movie_details_remote_data_source.dart';

class MoviesDetailsDataReposImplementation extends BaseGetMovieDetailsRepos {
  final BaseMovieDetailsRemoteDataSource baseMovieDetailsRemoteDataSource;

  MoviesDetailsDataReposImplementation({
    required this.baseMovieDetailsRemoteDataSource,
  });

  @override
  Future<Either<Errors, MovieDetailsEntities>> fetchMovieDetails(MovieDetailsParams params) async {
    try{
      var  result = await baseMovieDetailsRemoteDataSource.fetchMovieDetailsInRemoteDataSource(params);
      return right(result);
    }
    on ServerError catch(error)
    {
      return left(NetworkError(error.networkErrorModel.statusMsg));
    }

  }

  @override
  Future<Either<Errors, MovieDetailsEntities>> fetchRelatedMovies()async {
    try{
      var  result = await baseMovieDetailsRemoteDataSource.fetchRelatedMoviesInRemoteDataSource();
      return right(result);
    }
    on ServerError catch(error)
    {
      return left(NetworkError(error.networkErrorModel.statusMsg));
    }

  }
}
