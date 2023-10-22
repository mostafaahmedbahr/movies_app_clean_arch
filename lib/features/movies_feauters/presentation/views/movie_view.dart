import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch/core/service_locator/service_locator.dart';

import '../controller/movies_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(getIt())..add(FetchNowPlayingMovieEvent()),
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: state is ! GetNowPlayingMoviesLoadingState,
              fallback: (context){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
               builder: (context){
                return const Column(
                  children: [
                    Text("mostafa"),
                    Text("bahr"),
                  ],
                );
               },
            ),
          );
        },
      ),
    );
  }
}
