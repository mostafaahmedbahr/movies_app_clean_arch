import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';


abstract class MovieDetailsLocalDataSource{

   MovieDetailsEntities   fetchMovieDetailsInLocalDataSource();
   MovieDetailsEntities    fetchRelatedMoviesInLocalDataSource();
}