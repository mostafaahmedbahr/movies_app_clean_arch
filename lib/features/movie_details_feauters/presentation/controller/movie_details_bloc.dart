
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/use_cases/fetch_related_movies_use_case.dart';

import '../../domain/use_cases/fetch_movie_details_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  final FetchRelatedMoviesUseCase fetchRelatedMoviesUseCase;

  MovieDetailsBloc(this.fetchMovieDetailsUseCase, this.fetchRelatedMoviesUseCase) : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {
       emit(GetMovieDetailsLoadingState());
       var result =  await fetchMovieDetailsUseCase.call(MovieDetailsParams(event.movieId , ));
       print(result);
       print("get movie details ");
       result.fold((l){
         emit(GetMovieDetailsErrorState(l.errorMessage));
       }, (r){
         emit(GetMovieDetailsSuccessState(movieDetailsEntities: r));

       });
    });

    on<GetRelatedMoviesEvent>((event, emit) async {
      emit(GetRelatedMoviesLoadingState());
      var result =  await fetchRelatedMoviesUseCase.call(MovieDetailsParams(event.movieId , ));
      print(result);
      print("get related movie  ");
      result.fold((l){
        emit(GetRelatedMoviesErrorState(l.errorMessage));
      }, (r){
        emit(GetRelatedMoviesSuccessState());

      });
    });
  }
}
