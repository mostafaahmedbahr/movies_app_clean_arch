import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_clean_arch/core/service_locator/service_locator.dart';
import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';
 import 'package:movies_app_clean_arch/features/movie_details_feauters/presentation/controller/movie_details_bloc.dart';


import '../../../../core/utils/app_constance.dart';


class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
  create: (context) => MovieDetailsBloc(getIt() , getIt())
    ..add(GetMovieDetailsEvent(movieId: id))
    ..add(GetRelatedMoviesEvent(movieId: id)),
  child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
  builder: (context, state) {
    return   SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: const MovieDetailContent(

        ),
      ),
    );
  },
),
);
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
    builder: (context, state) {
      print(state);
      return
        Column(
        children: [
          if(state is GetMovieDetailsSuccessState )
            CachedNetworkImage(
                   height: 250,
                    width: MediaQuery.of(context).size.width,
                    imageUrl: "${AppConstance.imagesUrlPath}/${state.movieDetailsEntities.backdropPath}",
                    fit: BoxFit.cover,
                  ),
          if(state is GetMovieDetailsSuccessState )
            Text(state.movieDetailsEntities.title,
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                )),
          const SizedBox(height: 8.0),
          if(state is GetMovieDetailsSuccessState )
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  state.movieDetailsEntities.releaseDate.split('-')[0],
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    (state.movieDetailsEntities.voteAverage / 2).toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '(${state.movieDetailsEntities.voteAverage})',
                    style: const TextStyle(
                      fontSize: 1.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Text(
                "${state.movieDetailsEntities.runTime}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          if(state is GetMovieDetailsSuccessState )
          Text(
            state.movieDetailsEntities.overview,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8.0),
          if(state is GetMovieDetailsSuccessState )
          Text(
            'Genres: ${_showGenres(state.movieDetailsEntities.genres)}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
          FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: Text(
              'More like this'.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ),

        ],
      ) ;

    },
);
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  // Widget _showRecommendations() {
  //   return SliverGrid(
  //     delegate: SliverChildBuilderDelegate(
  //           (context, index) {
  //         final recommendation = recommendations[index];
  //         return FadeInUp(
  //           from: 20,
  //           duration: const Duration(milliseconds: 500),
  //           child: ClipRRect(
  //             borderRadius: const BorderRadius.all(Radius.circular(4.0)),
  //             child: CachedNetworkImage(
  //               imageUrl: "${AppConstance.imagesUrlPath}${recommendation.image}" ,
  //               placeholder: (context, url) => Shimmer.fromColors(
  //                 baseColor: Colors.grey[850]!,
  //                 highlightColor: Colors.grey[800]!,
  //                 child: Container(
  //                   height: 170.0,
  //                   width: 120.0,
  //                   decoration: BoxDecoration(
  //                     color: Colors.black,
  //                     borderRadius: BorderRadius.circular(8.0),
  //                   ),
  //                 ),
  //               ),
  //               errorWidget: (context, url, error) => const Icon(Icons.error),
  //               height: 180.0,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         );
  //       },
  //       childCount: 1,
  //     ),
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       mainAxisSpacing: 8.0,
  //       crossAxisSpacing: 8.0,
  //       childAspectRatio: 0.7,
  //       crossAxisCount: 3,
  //     ),
  //   );
  // }
}
