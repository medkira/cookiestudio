// import 'dart:convert';

import 'package:cookiestudio/app/constants.dart';
import 'package:cookiestudio/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/user/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/user/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  @POST("/user/register")
  Future<AuthenticationResponse> register(
    @Field("email") String email,
    @Field("password") String password,
    @Field("userName") String userName,
    @Field("mobileNumber") String mobileNumber,
    @Field("countryMobileCode") String countryMobileCode,
  );
}
