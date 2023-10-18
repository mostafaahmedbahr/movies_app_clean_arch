part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvents {}

class FetchNowPlayingMovieEvent extends MoviesEvents{}
class FetchPopularMoviesEvent extends MoviesEvents{}
class FetchTopRatedMoviesEvent extends MoviesEvents{}
