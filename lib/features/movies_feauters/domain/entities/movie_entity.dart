class MovieEntity {
  final int movieEntityId;
  final String movieEntityBackdropPath;
  final String movieEntityOriginalTitle;
  final String movieEntityOverview;
  final num movieEntityVoteAverage;
  final num movieEntityVoteCount;
  final List<int> movieEntityGenreIds;

  MovieEntity(
      {required this.movieEntityId,
      required this.movieEntityBackdropPath,
      required this.movieEntityOriginalTitle,
      required this.movieEntityGenreIds,
      required this.movieEntityOverview,
      required this.movieEntityVoteAverage,
      required this.movieEntityVoteCount});
}
