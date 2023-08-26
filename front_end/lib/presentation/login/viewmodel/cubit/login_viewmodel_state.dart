part of 'login_viewmodel_cubit.dart';

@immutable
sealed class LoginViewmodelState {}

final class LoginViewmodelInitial extends LoginViewmodelState {}

final class LoginViewmodelCounterState extends LoginViewmodelState {
  final int count;
  LoginViewmodelCounterState({this.count = 0});
}

final class Test extends LoginViewmodelState {
  final int count;
  Test({required this.count});
}
