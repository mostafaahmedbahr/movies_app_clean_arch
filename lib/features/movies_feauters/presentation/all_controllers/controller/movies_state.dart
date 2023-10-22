part of 'movies_bloc.dart';

@immutable
abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class GetNowPlayingMoviesLoadingState extends MoviesStates {}
class GetNowPlayingMoviesSuccessState extends MoviesStates {
  final List<MovieEntity> moviesList;
  GetNowPlayingMoviesSuccessState(this.moviesList);
}
class GetNowPlayingMoviesErrorState extends MoviesStates {
  final String error;
  GetNowPlayingMoviesErrorState(this.error);
}

