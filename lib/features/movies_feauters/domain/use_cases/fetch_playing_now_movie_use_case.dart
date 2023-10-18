  import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/entities/movie_entity.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/repos/base_movie_repo.dart';

import '../../../../core/errors/error_class.dart';
import '../../../../core/use_cases/use_case_with_no_param.dart';

class FetchPlayingNowMovieUseCase extends UseCaseWithNoParam<List<MovieEntity>>
{
  final BaseMovieRepo baseMovieRepo;
  FetchPlayingNowMovieUseCase(this.baseMovieRepo);

  @override
  Future<Either<Errors, List<MovieEntity>>> call() async {
    return await baseMovieRepo.fetchPlayingNowMovie();

  }
}