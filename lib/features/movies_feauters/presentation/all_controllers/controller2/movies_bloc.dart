
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_popular_movies_use_case.dart';

import '../../../domain/entities/movie_entity.dart';


part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc2 extends Bloc<MoviesEvents2, MoviesStates2> {

  final FetchPopularMoviesUseCase fetchPopularMoviesUseCase;

  MoviesBloc2(  this.fetchPopularMoviesUseCase, ) : super(MoviesInitialState()) {


    on<FetchPopularMoviesEvent2>((event, emit) async{
      emit(GetPopularMoviesLoadingState2());
      var result =  await fetchPopularMoviesUseCase.call();
      print(result);
      print("hello 2");
      result.fold((l){
        emit(GetPopularMoviesErrorState2(l.errorMessage));
      }, (r){
        emit(GetPopularMoviesSuccessState2(r.toList()));

      });


    });




  }
}
