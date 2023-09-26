import 'package:bloc/bloc.dart';
import 'package:cookiestudio/domain/usecase/login_usecase.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:cookiestudio/presentation/common/freezed_data_classes.dart';
import 'package:flutter/material.dart';

part 'login_viewmodel_state.dart';

class LoginViewmodelCubit extends Cubit<LoginViewmodelState>
    implements LoginViewModelInputs, BaseViewModel {
  LoginViewmodelCubit(this._loginUseCase) : super(LoginInitial());

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  LoginObject loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;
  // String _email;
  // String _password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void start() {
    // Initialize the state of the cubit.
    // emit(LoginViewmodelInitial(
    //     userEmail: '', password: '', loginButtonEnabled: false));
  }

  @override
  login() async {
    // # loading state
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      (await _loginUseCase.execute(
              LoginUseCaseInput(loginObject.userEmail, loginObject.password)))
          .fold(
        (failure) => {
          // ? left -> failure
          // # failure state
          emit(LoginFailure(failure.message)),
          print(failure.message),
          print(failure.code)
        },
        (data) => {
          // ? right -> data (success)
          // # success state
          emit(LoginSuccess()),
          print(data.customer?.firstName),
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => RegisterView()))
        },
      );
    }
  }

  @override
  setUserEmail(String userEmail) {
    loginObject = loginObject.copyWith(userEmail: userEmail);
  }

  @override
  setPassword(String password) {
    loginObject = loginObject.copyWith(password: password);
  }
}

abstract class LoginViewModelInputs {
  setUserEmail(String userEmail);
  setPassword(String password);
  login();
}

abstract class LoginViewModelOutput {}






















  // LoginViewmodelCounterState(count: 0);
//  void increment() {
//     if (state is LoginViewmodelCounterState) {
//       final count = (state as LoginViewmodelCounterState).count + 1;
//       final updatedState = LoginViewmodelCounterState(count: count);
//       emit(updatedState);
//     } else {
//       emit(LoginViewmodelCounterState(count: 1));
//       // emit(Test(count: 1));
//     }
//   }

  // void decrement() {
  //   final count = (state as LoginViewmodelCounterState).count - 1;
  //   final updatedState = LoginViewmodelCounterState(count: count);
  //   emit(updatedState);
  // }