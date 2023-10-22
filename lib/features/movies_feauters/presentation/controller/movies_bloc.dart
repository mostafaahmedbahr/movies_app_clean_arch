
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_popular_movies_use_case.dart';

import '../../domain/entities/movie_entity.dart';
 import '../../domain/use_cases/fetch_playing_now_movie_use_case.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final FetchPlayingNowMovieUseCase fetchPlayingNowMovieUseCase;
  final FetchPopularMoviesUseCase fetchPopularMoviesUseCase;
  MoviesBloc(this.fetchPlayingNowMovieUseCase, this.fetchPopularMoviesUseCase) : super(MoviesInitialState()) {
    on<MoviesEvents>((event, emit) async{
     if(event is FetchNowPlayingMovieEvent){
       emit(GetNowPlayingMoviesLoadingState());
         var result =  await fetchPlayingNowMovieUseCase.call();
       print(result);
       print("hello");
       result.fold((l){
         emit(GetNowPlayingMoviesErrorState(l.errorMessage));
       }, (r){
         emit(GetNowPlayingMoviesSuccessState(r.toList()));
       });
     }
     if(event is FetchPopularMoviesEvent){
       emit(GetPopularMoviesLoadingState());
       var result =  await fetchPopularMoviesUseCase.call();
       print(result);
       print("hello 2");
       result.fold((l){
         emit(GetPopularMoviesErrorState(l.errorMessage));
       }, (r){
         emit(GetPopularMoviesSuccessState(r.toList()));
       });
     }
    });


  }
}
