class MovieDetailsEntities {
  final int id;
  final String backdropPath;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final num voteCount;
  final num voteAverage;
  final num runTime;


  MovieDetailsEntities(this.runTime, {required this.id, required this.backdropPath, required this.title, required this.posterPath, required this.overview, required this.releaseDate, required this.voteCount, required this.voteAverage, });


}
