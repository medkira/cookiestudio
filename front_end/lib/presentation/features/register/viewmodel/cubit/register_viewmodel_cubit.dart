import 'package:bloc/bloc.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:flutter/material.dart';

part 'register_viewmodel_state.dart';

class RegisterViewmodelCubit extends Cubit<RegisterViewmodelState>
    implements BaseViewModel, RegisterViewModelInputs {
  RegisterViewmodelCubit() : super(RegisterInitial());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  late String email;
  late String password;
  late String confirmPassword;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  void start() {}

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  setCountryMobileCode(String countryMobileCode) {
    // TODO: implement setCountryMobileCode
    throw UnimplementedError();
  }

  @override
  setMobileNumber(String mobileNumber) {
    // TODO: implement setMobileNumber
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    this.password = password;
  }

  @override
  setUserEmail(String email) {
    this.email = email;
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  setUserProfilePicture(String profilePicture) {
    // TODO: implement setUserProfilePicture
    throw UnimplementedError();
  }
}

abstract class RegisterViewModelInputs {
  setCountryMobileCode(String countryMobileCode);
  setUserName(String userName);
  setUserEmail(String userEmail);
  setPassword(String password);
  setUserProfilePicture(String profilePicture);
  setMobileNumber(String mobileNumber);
  register();
}
