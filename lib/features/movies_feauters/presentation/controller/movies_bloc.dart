import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/data/data_repos/movie_repo_in_data.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/data/data_sources/movies_remote_data_source.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/repos/base_movie_repo.dart';
import '../../domain/use_cases/fetch_playing_now_movie_use_case.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  MoviesBloc() : super(MoviesInitialState()) {
    on<MoviesEvents>((event, emit) async{
     if(event is FetchNowPlayingMovieEvent){
       emit(GetNowPlayingMoviesLoadingState());
       BaseMovieRemoteDataSource baseMovieRemoteDataSource = MovieRemoteDataSourceImplementation();
       BaseMovieRepo baseMovieRepo = MovieRepoImplementation(baseMovieRemoteDataSource: baseMovieRemoteDataSource);
        await FetchPlayingNowMovieUseCase(baseMovieRepo).call().then((value){
        print(value);
         emit(GetNowPlayingMoviesSuccessState([]));
       }).catchError((error){
         emit(GetNowPlayingMoviesErrorState(error.toString()));
       });
     }
    });
  }
}
