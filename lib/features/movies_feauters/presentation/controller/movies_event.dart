part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class FetchNowPlayingMovieEvent extends MoviesEvent{}
class FetchPopularMoviesEvent extends MoviesEvent{}
class FetchTopRatedMoviesEvent extends MoviesEvent{}
