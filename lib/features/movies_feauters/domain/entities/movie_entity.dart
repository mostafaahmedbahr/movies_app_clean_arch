class MovieEntity {
  final int movieEntityId;
  final String movieEntityBackdropPath;
  final String movieEntityOriginalTitle;
  final String movieEntityOverview;
  final num movieEntityVoteAverage;
  final num movieEntityVoteCount;
  final List<int> movieEntityGenreIds;

  MovieEntity(
      this.movieEntityId,
      this.movieEntityBackdropPath,
      this.movieEntityOriginalTitle,
      this.movieEntityGenreIds,
      this.movieEntityOverview,
      this.movieEntityVoteAverage,
      this.movieEntityVoteCount);
}
