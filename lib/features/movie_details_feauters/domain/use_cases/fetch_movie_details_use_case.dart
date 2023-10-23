import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch/core/errors/error_class.dart';
import 'package:movies_app_clean_arch/core/use_cases/use_case_with_param.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/repos/get_movie_details_repos.dart';

class FetchMovieDetailsUseCase extends UseCaseWithParam<MovieDetailsEntities , MovieDetailsParams >{
  final BaseGetMovieDetailsRepos baseGetMovieDetailsRepos;

  FetchMovieDetailsUseCase(this.baseGetMovieDetailsRepos);

  @override
  Future<Either<Errors, MovieDetailsEntities>> call(MovieDetailsParams param) async{
   return  await baseGetMovieDetailsRepos.fetchMovieDetails(param);
  }



  }


  // عشان اعرف ابعت اكتر من param
  class MovieDetailsParams {
  final int movieId;
  final String movieName;

  MovieDetailsParams(this.movieId, this.movieName);
  }