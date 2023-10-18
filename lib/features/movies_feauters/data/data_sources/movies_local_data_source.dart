import 'package:movies_app_clean_arch/features/movies_feauters/domain/entities/movie_entity.dart';

abstract class BaseHomeLocalDataSource{

  List<MovieEntity> fetchPlayingNowMovieInLocalDataSource();
  List<MovieEntity>   fetchPopularMoviesInLocalDataSource();
  List<MovieEntity>  fetchTopRatedMoviesInLocalDataSource();

}