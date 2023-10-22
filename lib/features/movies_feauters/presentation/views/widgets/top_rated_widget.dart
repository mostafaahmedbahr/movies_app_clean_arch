import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../core/utils/dummy.dart';
import '../../all_controllers/controller3/movies_bloc.dart';

class TopRatedCustomWidget extends StatelessWidget {
  const TopRatedCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc3>()
        ..add(FetchTopRatedMoviesEvent3()),
      child: BlocBuilder<MoviesBloc3, MoviesStates3>(
        builder: (context, state) {
          print(state);
          print("mostaf in TopRatedCustomWidget");
          final moviesBloc = context.read<MoviesBloc3>();
          if (state is GetTopRatedMoviesSuccessState3) {
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMoviesList.length,
                  itemBuilder: (context, index) {
                    final topRatedMoviesList = state.topRatedMoviesList[index];
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
                            "${AppConstance.imagesUrlPath}${topRatedMoviesList
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
          else {
            return Text("error 3");
          }
        },
      ),
    );
  }
}
