
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_popular_movies_use_case.dart';
import 'package:movies_app_clean_arch/features/movies_feauters/domain/use_cases/fetch_top_rated_movies_use_case.dart';

import '../../../domain/entities/movie_entity.dart';


part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc3 extends Bloc<MoviesEvents3, MoviesStates3> {

  final FetchTopRatedMoviesUseCase fetchTopRatedMoviesUseCase;

  MoviesBloc3(  this.fetchTopRatedMoviesUseCase, ) : super(MoviesInitialState()) {


    on<FetchTopRatedMoviesEvent3>((event, emit) async{
      emit( (GetTopRatedMoviesLoadingState3()));
      var result =  await fetchTopRatedMoviesUseCase.call();
      print(result);
      print("hello 3");
      result.fold((l){
        emit( GetTopRatedMoviesErrorState3(l.errorMessage));
      }, (r){
        emit( GetTopRatedMoviesSuccessState3(r.toList()));

      });


    });




  }
}
