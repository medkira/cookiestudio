import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/request/requests.dart';
import '../model/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, ForgotPassword>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
}
