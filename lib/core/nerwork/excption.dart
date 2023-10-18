import 'network_error_model.dart';

class ServerError implements Exception{
  final NetworkErrorModel networkErrorModel;
  ServerError({required this.networkErrorModel});

}