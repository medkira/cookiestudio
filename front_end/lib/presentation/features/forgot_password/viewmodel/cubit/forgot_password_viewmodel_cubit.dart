import 'package:bloc/bloc.dart';
import 'package:cookiestudio/domain/usecase/forgot_password_usecase.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:flutter/cupertino.dart';

part 'forgot_password_viewmodel_state.dart';

class ForgotPasswordViewmodelCubit extends Cubit<ForgotPasswordViewmodelState>
    implements BaseViewModel, ForgotPasswordViewmodelInputs {
  ForgotPasswordViewmodelCubit(this._forgotPasswordUseCase)
      : super(ForgotPasswordInitial());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late String email;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  @override
  void dispose() {}

  @override
  void start() {}

  @override
  resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgotPasswordLoading());
      (await _forgotPasswordUseCase.execute(ForgotPasswordUseCaseInput(email)))
          .fold(
        (failure) => {
          emit(ForgotPasswordFailure(failure.message)),
        },
        (data) => {
          print(data),
          emit(ForgotPasswordSuccess(data.support)),
        },
      );
    }
  }

  @override
  setUserEmail(String userEmail) {
    email = userEmail;
  }
}

abstract class ForgotPasswordViewmodelInputs {
  setUserEmail(String userEmail);
  resetPassword();
}
