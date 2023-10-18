// class MovieEntity {
//   final int movieEntityId;
//   final String movieEntityBackdropPath;
//   final String movieEntityOriginalTitle;
//   final String movieEntityOverview;
//   final num movieEntityVoteAverage;
//   final num movieEntityVoteCount;
//   final List<int> movieEntityGenreIds;
//
//
//   // نحط const عشان نمنع التكرار ال object عشان الاداء وال memory
//
//   // أو استخدم
//   const MovieEntity(
//       {required this.movieEntityId,
//       required this.movieEntityBackdropPath,
//       required this.movieEntityOriginalTitle,
//       required this.movieEntityGenreIds,
//       required this.movieEntityOverview,
//       required this.movieEntityVoteAverage,
//       required this.movieEntityVoteCount});
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is MovieEntity &&
//           runtimeType == other.runtimeType &&
//           movieEntityId == other.movieEntityId &&
//           movieEntityBackdropPath == other.movieEntityBackdropPath &&
//           movieEntityOriginalTitle == other.movieEntityOriginalTitle &&
//           movieEntityOverview == other.movieEntityOverview &&
//           movieEntityVoteAverage == other.movieEntityVoteAverage &&
//           movieEntityVoteCount == other.movieEntityVoteCount &&
//           movieEntityGenreIds == other.movieEntityGenreIds;
//
//   @override
//   int get hashCode =>
//       movieEntityId.hashCode ^
//       movieEntityBackdropPath.hashCode ^
//       movieEntityOriginalTitle.hashCode ^
//       movieEntityOverview.hashCode ^
//       movieEntityVoteAverage.hashCode ^
//       movieEntityVoteCount.hashCode ^
//       movieEntityGenreIds.hashCode;
// }
//


import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int movieEntityId;
  final String movieEntityBackdropPath;
  final String movieEntityOriginalTitle;
  final String movieEntityOverview;
  final num movieEntityVoteAverage;
  final num movieEntityVoteCount;
  final List<int> movieEntityGenreIds;


  // نحط const عشان نمنع التكرار ال object عشان الاداء وال memory

  // أو استخدمEquatable
  const MovieEntity({required this.movieEntityId,
    required this.movieEntityBackdropPath,
    required this.movieEntityOriginalTitle,
    required this.movieEntityGenreIds,
    required this.movieEntityOverview,
    required this.movieEntityVoteAverage,
    required this.movieEntityVoteCount});

  @override
  @override
  List<Object> get props =>
      [
        movieEntityId,
        movieEntityBackdropPath,
        movieEntityOriginalTitle,
        movieEntityOverview,
        movieEntityVoteAverage,
        movieEntityVoteCount,
        movieEntityGenreIds,
      ];


}
