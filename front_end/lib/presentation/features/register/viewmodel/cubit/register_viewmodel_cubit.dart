import 'package:bloc/bloc.dart';
import 'package:cookiestudio/domain/usecase/register_usecase.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

part 'register_viewmodel_state.dart';

class RegisterViewmodelCubit extends Cubit<RegisterViewmodelState>
    implements BaseViewModel, RegisterViewModelInputs {
  RegisterViewmodelCubit(this._registerUsecase) : super(RegisterInitial());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RegisterUsecase _registerUsecase;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get userNameController => _userNameController;
  late String email;
  late String password;
  late String confirmPassword;
  late String phoneNumber;
  late String countryCode = "+216";
  late String username;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  void start() {}

  @override
  register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      (await _registerUsecase.execute(RegisterUsecaseInput(
              email, password, countryCode, phoneNumber, username)))
          .fold(
        (failure) {
          emit(RegisterFailure(failure.message));
        },
        (data) {
          emit(RegisterSuccess());
        },
      );
    }
  }

  @override
  setCountryMobileCode(String countryMobileCode) {
    countryCode = countryMobileCode.toString();
  }

  @override
  setMobileNumber(String mobileNumber) {
    phoneNumber = mobileNumber;
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
    username = userName;
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
