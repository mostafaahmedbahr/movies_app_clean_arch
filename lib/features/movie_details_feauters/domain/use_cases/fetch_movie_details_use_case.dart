import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch/core/errors/error_class.dart';
import 'package:movies_app_clean_arch/core/use_cases/use_case_with_param.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/repos/get_movie_details_repos.dart';

class FetchMovieDetailsUseCase extends UseCaseWithParam{
  final BaseGetMovieDetailsRepos baseGetMovieDetailsRepos;

  FetchMovieDetailsUseCase(this.baseGetMovieDetailsRepos);

  @override
  Future<Either<Errors, List<MovieDetailsEntities>>> call(param) async{
   return  await baseGetMovieDetailsRepos.fetchMovieDetails();
  }



  }
