import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_class.dart';
import '../entities/movie_entity.dart';

abstract class BaseMovieRepo{

  Future<Either< Errors, List<MovieEntity>>> fetchPlayingNowMovie();
  Future<Either< Errors, List<MovieEntity>>> fetchPopularMovies();
  Future<Either< Errors, List<MovieEntity>>> fetchTopRatedMovies();
}