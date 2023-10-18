part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class GetNowPlayingMoviesLoadingState extends MoviesState {}
class GetNowPlayingMoviesSuccessState extends MoviesState {}
class GetNowPlayingMoviesErrorState extends MoviesState {}

class GetPopularMoviesLoadingState extends MoviesState {}
class GetPopularMoviesSuccessState extends MoviesState {}
class GetPopularMoviesErrorState extends MoviesState {}

class GetTopRatedMoviesLoadingState extends MoviesState {}
class GetTopRatedMoviesSuccessState extends MoviesState {}
class GetTopRatedMoviesErrorState extends MoviesState {}
