import 'package:dartz/dartz.dart';

import '../errors/error_class.dart';

abstract class UseCaseWithNoParam<Type>
{
  Future<Either< Errors, Type>> call();
}