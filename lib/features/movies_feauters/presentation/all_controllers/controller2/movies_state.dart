part of 'movies_bloc.dart';

@immutable
abstract class MoviesStates2 {}

class MoviesInitialState extends MoviesStates2 {}


class GetPopularMoviesLoadingState2 extends MoviesStates2 {}
class GetPopularMoviesSuccessState2 extends MoviesStates2 {
  final List<MovieEntity> popularMoviesList;
  GetPopularMoviesSuccessState2(this.popularMoviesList);
}
class GetPopularMoviesErrorState2 extends MoviesStates2 {
  final String error;
  GetPopularMoviesErrorState2(this.error);
}


