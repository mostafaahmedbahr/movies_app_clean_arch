part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class GetMovieDetailsLoadingState extends MovieDetailsState {}
class GetMovieDetailsSuccessState extends MovieDetailsState {}
class GetMovieDetailsErrorState extends MovieDetailsState {
  final String error;
  GetMovieDetailsErrorState(this.error);
}
