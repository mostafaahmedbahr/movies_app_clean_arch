
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/fetch_movie_details_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;

  MovieDetailsBloc(this.fetchMovieDetailsUseCase) : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {
       emit(GetMovieDetailsLoadingState());
       var result =  await fetchMovieDetailsUseCase.call(MovieDetailsParams(event.movieId , ));
       print(result);
       print("get movie details ");
       result.fold((l){
         emit(GetMovieDetailsErrorState(l.errorMessage));
       }, (r){
         emit(GetMovieDetailsSuccessState());

       });
    });

    // on<GetMovieDetailsEven>((event, emit) {
    //
    // });
  }
}
