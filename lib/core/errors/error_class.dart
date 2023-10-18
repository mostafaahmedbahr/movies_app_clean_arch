import 'package:dio/dio.dart';
import 'package:movies_app_clean_arch/core/nerwork/network_error_model.dart';

abstract class Errors{}

class ServerError implements Exception{
  final NetworkErrorModel networkErrorModel;
  ServerError({required this.networkErrorModel});

}

class NetworkError extends Errors{}
class CachedError extends Errors{}