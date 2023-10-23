import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_class.dart';
import '../entities/movie_details_entites.dart';
import '../use_cases/fetch_movie_details_use_case.dart';

abstract class BaseGetMovieDetailsRepos {

  Future<Either<Errors,  MovieDetailsEntities>> fetchMovieDetails(MovieDetailsParams params);

  Future<Either<Errors,  MovieDetailsEntities>> fetchRelatedMovies(MovieDetailsParams params);
}
