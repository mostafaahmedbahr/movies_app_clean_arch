import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_class.dart';
import '../entities/movie_details_entites.dart';

abstract class BaseGetMovieDetailsRepos {

  Future<Either<Errors, List<MovieDetailsEntities>>> fetchMovieDetails();

  Future<Either<Errors, List<MovieDetailsEntities>>> fetchRelatedMovies();
}
