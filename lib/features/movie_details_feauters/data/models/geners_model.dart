import 'package:movies_app_clean_arch/features/movie_details_feauters/domain/entities/movie_details_entites.dart';

class GenresModel extends Genre
{
  GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json)=>GenresModel(
      name: json["name"],
      id: json["id"],
  );

}