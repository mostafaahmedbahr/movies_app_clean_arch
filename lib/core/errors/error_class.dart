 import 'package:movies_app_clean_arch/core/nerwork/network_error_model.dart';

abstract class Errors{

  final String errorMessage;
  Errors(this.errorMessage);

}

 class NetworkError extends Errors{
   NetworkError(super.errorMessage);

 }

 class CachedError extends Errors{
  CachedError(super.errorMessage);

 }




