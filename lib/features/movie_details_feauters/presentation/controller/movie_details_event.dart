part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int movieId;
  GetMovieDetailsEvent({required this.movieId});
}
class GetRelatedMoviesEvent extends MovieDetailsEvent{
  final int movieId;
  GetRelatedMoviesEvent({required this.movieId});
}
