part of 'movies_bloc.dart';

@immutable
abstract class MoviesStates3 {}

class MoviesInitialState extends MoviesStates3 {}

class GetTopRatedMoviesLoadingState3 extends MoviesStates3 {}

class GetTopRatedMoviesSuccessState3 extends MoviesStates3 {
  final List<MovieEntity> topRatedMoviesList;

  GetTopRatedMoviesSuccessState3(this.topRatedMoviesList);
}

class GetTopRatedMoviesErrorState3 extends MoviesStates3 {
  final String error;

  GetTopRatedMoviesErrorState3(this.error);
}
