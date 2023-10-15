import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> requiredParamCall({required Param category});
}

class NoParam {}
