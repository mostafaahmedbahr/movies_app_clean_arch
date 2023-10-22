import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch/core/service_locator/service_locator.dart';
 import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_constance.dart';
import '../../all_controllers/controller2/movies_bloc.dart';

class PopularCustomWidget extends StatelessWidget {
  const PopularCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc2>()
        ..add(FetchPopularMoviesEvent2()),
      child: BlocBuilder<MoviesBloc2, MoviesStates2>(
        builder: (context, state) {
          print(state);
          print("mostaf in PopularCustomWidget");
          if (state is GetPopularMoviesSuccessState2) {
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMoviesList.length,
                  itemBuilder: (context, index) {
                    final popularMoviesList = state.popularMoviesList[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                            "${AppConstance.imagesUrlPath}${popularMoviesList
                                .movieEntityBackdropPath}",
                            placeholder: (context, url) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          else if (state is GetPopularMoviesLoadingState2) {
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else if (state is GetPopularMoviesErrorState2) {
            return SizedBox(
              height: 400.0,
              child: Center(
                child: Text(state.error),
              ),
            );
          }
          else {
            return const Center(child: Text("error 0"));
          }
        },
      ),
    );
  }
}
