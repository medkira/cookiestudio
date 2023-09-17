import 'package:cookiestudio/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> execute(Input input);
}
