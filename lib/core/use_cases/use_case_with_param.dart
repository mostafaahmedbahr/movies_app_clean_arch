import 'package:dartz/dartz.dart';

import '../errors/error_class.dart';

abstract class UseCaseWithParam<Type , Param>
{
  Future<Either< Errors, Type>> call(Param param);
}