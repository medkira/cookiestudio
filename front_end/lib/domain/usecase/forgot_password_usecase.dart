import 'package:cookiestudio/data/network/failure.dart';
import 'package:cookiestudio/data/request/requests.dart';
import 'package:cookiestudio/domain/model/models.dart';
import 'package:cookiestudio/domain/repository/repository.dart';
import 'package:cookiestudio/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordUseCaseInput, ForgotPassword> {
  final Repository _repository;
  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgotPassword>> execute(
      ForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(ForgotPasswordRequest(input.email));
  }
}

class ForgotPasswordUseCaseInput {
  String email;
  ForgotPasswordUseCaseInput(this.email);
}
