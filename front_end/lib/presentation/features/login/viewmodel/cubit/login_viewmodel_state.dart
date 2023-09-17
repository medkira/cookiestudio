part of 'login_viewmodel_cubit.dart';

@immutable
sealed class LoginViewmodelState {}
// final class LoginViewmodelInitial extends LoginViewmodelState {
//   final LoginObject loginObject;

//   LoginViewmodelInitial({required this.loginObject});
// }

// ! state testing i need to remove.

// final class LoginViewmodelInitial extends LoginViewmodelState {
//   final String userEmail;
//   final String password;
//   final bool loginButtonEnabled;

//   LoginViewmodelInitial({
//     this.userEmail = '',
//     this.password = '',
//     this.loginButtonEnabled = false,
//   });
// }

final class LoginViewmodelCounterState extends LoginViewmodelState {
  final int count;
  LoginViewmodelCounterState({this.count = 0});
}

final class Test extends LoginViewmodelState {
  final int count;
  Test({required this.count});
}

final class LoginInfo extends LoginViewmodelState {
  final String email;

  LoginInfo({required this.email});
}

// * login state update logic .

final class LoginInitial extends LoginViewmodelState {}

final class LoginLoading extends LoginViewmodelState {}

final class LoginFailure extends LoginViewmodelState {
  final String apiMessage;
  LoginFailure(this.apiMessage);
}

final class LoginSuccess extends LoginViewmodelState {}
