import 'package:cookiestudio/data/data_source/remote_data_source.dart';
import 'package:cookiestudio/data/mapper/mapper.dart';
import 'package:cookiestudio/data/network/error_handler.dart';
import 'package:cookiestudio/data/network/failure.dart';
import 'package:cookiestudio/data/network/network_info.dart';
import 'package:cookiestudio/data/request/requests.dart';
import 'package:cookiestudio/domain/model/models.dart';
import 'package:cookiestudio/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // # its connected to internet, its safe to call the API
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // ? success
          // ? return either right
          // ? return data
          return Right(response.toDomain());
        } else {
          // ? failure -- business error
          // ? return either left
          print(response);
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        // ? problem in the server it self stetus code 400-500
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // # return internet connection error
      // # return either left
      return Left(DataSource.NO_INTERNET_CONNECTION
          .getFailure()); //Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION)
    }
  }

  @override
  Future<Either<Failure, ForgotPassword>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.forgotPassword(forgotPasswordRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
