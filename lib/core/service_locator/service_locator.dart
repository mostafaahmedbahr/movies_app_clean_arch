import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/data/data_repos/movies_details_data_repos.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/data/data_sources/movie_details_remote_data_source.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/repos/get_movie_details_repos.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/use_cases/fetch_related_movies_use_case.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_playing_now_movie_use_case.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_popular_movies_use_case.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_top_rated_movies_use_case.dart';

import '../../features/movie_details_feauters/presentation/controller/movie_details_bloc.dart';
import '../../features/movies_feauters/data/data_repos/movie_repo_in_data.dart';
import '../../features/movies_feauters/data/data_sources/movies_remote_data_source.dart';
import '../../features/movies_feauters/domain/repos/base_movie_repo.dart';
import '../../features/movies_feauters/presentation/all_controllers/controller/movies_bloc.dart';
import '../../features/movies_feauters/presentation/all_controllers/controller2/movies_bloc.dart';
import '../../features/movies_feauters/presentation/all_controllers/controller3/movies_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    //bloc
    // هنا عشان يعمل اوبجيكت جديد كل مرة
    getIt.registerFactory(() => MoviesBloc(getIt()));
    getIt.registerFactory(() => MoviesBloc2(getIt()));
    getIt.registerFactory(() => MoviesBloc3(getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt() , getIt()));
    // use case
    getIt.registerLazySingleton(() => FetchPlayingNowMovieUseCase(getIt()));
    getIt.registerLazySingleton(() => FetchPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => FetchTopRatedMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => FetchMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => FetchRelatedMoviesUseCase(getIt()));

    // repo
    getIt.registerLazySingleton<BaseMovieRepo>(
        () => MovieRepoImplementation(baseMovieRemoteDataSource: getIt()));
    getIt.registerLazySingleton<BaseGetMovieDetailsRepos>(() =>
        MoviesDetailsDataReposImplementation(
            baseMovieDetailsRemoteDataSource: getIt()));

    // data source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSourceImplementation());
    getIt.registerLazySingleton<BaseMovieDetailsRemoteDataSource>(
        () => MovieDetailsRemoteDataSourceImplementation());
  }
}
