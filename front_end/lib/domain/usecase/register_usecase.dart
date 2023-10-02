import 'package:cookiestudio/data/network/failure.dart';
import 'package:cookiestudio/data/request/requests.dart';
import 'package:cookiestudio/domain/model/models.dart';
import 'package:cookiestudio/domain/repository/repository.dart';
import 'package:cookiestudio/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase
    implements BaseUseCase<RegisterUsecaseInput, Authentication> {
  final Repository _repository;
  RegisterUsecase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUsecaseInput input) async {
    return await _repository.register(RegisterRequest(
        input.email,
        input.password,
        input.countryMobileCode,
        input.mobileNumber,
        input.userName));
  }
}

class RegisterUsecaseInput {
  String countryMobileCode;
  String userName;
  String email;
  String password;
  // String profilePicture;
  String mobileNumber;
  RegisterUsecaseInput(this.email, this.password, this.countryMobileCode,
      this.mobileNumber, this.userName);
}
