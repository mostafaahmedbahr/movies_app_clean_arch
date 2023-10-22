import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_playing_now_movie_use_case.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/presentation/controller/movies_bloc.dart';

import '../../features/movies_feauters/data/data_repos/movie_repo_in_data.dart';
import '../../features/movies_feauters/data/data_sources/movies_remote_data_source.dart';
import '../../features/movies_feauters/domain/repos/base_movie_repo.dart';


final getIt = GetIt.instance;

class ServiceLocator{

  void init()
  {
    
    //bloc
    // هنا عشان يعمل اوبجيكت جديد كل مرة
    getIt.registerFactory(() => MoviesBloc(getIt()));
    // use case
    getIt.registerLazySingleton(() => FetchPlayingNowMovieUseCase( getIt()));

    // repo
    getIt.registerLazySingleton<BaseMovieRepo>(() => MovieRepoImplementation( baseMovieRemoteDataSource: getIt()));

    // data source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSourceImplementation());
  }
}