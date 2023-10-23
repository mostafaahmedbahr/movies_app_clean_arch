import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch/core/errors/error_class.dart';
import 'package:movies_app_clean_arch/core/use_cases/use_case_with_param.dart';
 import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/recommendation_entity.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/repos/get_movie_details_repos.dart';

import 'fetch_movie_details_use_case.dart';

class FetchRelatedMoviesUseCase extends UseCaseWithParam <List<RecommendationEntity> , MovieDetailsParams >{
  final BaseGetMovieDetailsRepos baseGetMovieDetailsRepos;

  FetchRelatedMoviesUseCase(this.baseGetMovieDetailsRepos);

  @override
  Future<Either<Errors, List<RecommendationEntity>>> call(MovieDetailsParams param) async {
    return await baseGetMovieDetailsRepos.fetchRelatedMovies(param);
  }
}
