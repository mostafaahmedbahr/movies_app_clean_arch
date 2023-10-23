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
  final List<Genre> genres;


  MovieDetailsEntities(this.runTime, this.genres, {required this.id, required this.backdropPath, required this.title, required this.posterPath, required this.overview, required this.releaseDate, required this.voteCount, required this.voteAverage, });


}


class Genre
{
  final String name;
  final int id;

  Genre({required this.name, required this.id});


}