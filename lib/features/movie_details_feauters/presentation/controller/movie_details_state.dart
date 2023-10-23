part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class GetMovieDetailsLoadingState extends MovieDetailsState {}
class GetMovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetailsEntities movieDetailsEntities;
  GetMovieDetailsSuccessState({required this.movieDetailsEntities});
}
class GetMovieDetailsErrorState extends MovieDetailsState {
  final String error;
  GetMovieDetailsErrorState(this.error);
}

class GetRelatedMoviesLoadingState extends MovieDetailsState {}
class GetRelatedMoviesSuccessState extends MovieDetailsState {}
class GetRelatedMoviesErrorState extends MovieDetailsState {
  final String error;
  GetRelatedMoviesErrorState(this.error);
}
