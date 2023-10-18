import 'package:dio/dio.dart';
import 'package:movies_app_clean_arch/core/utils/app_constance.dart';


class ApiServices
{
  final Dio? dio;
  //https://api.themoviedb.org/3/movie/now_playing?api_key=15c10f1e6f57307786fce9d03376ba60
  final   baseUrl = AppConstance.baseUrl;

  ApiServices(this.dio);

  Future<Map<String, dynamic>> getData({
    required String url,
  }) async
  {
    var response = await dio!.get("$baseUrl$url");
    return response.data;
  }





}