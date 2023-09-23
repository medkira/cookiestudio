part of 'forgot_password_viewmodel_cubit.dart';

@immutable
sealed class ForgotPasswordViewmodelState {}

final class ForgotPasswordInitial extends ForgotPasswordViewmodelState {}

final class ForgotPasswordLoading extends ForgotPasswordViewmodelState {}

final class ForgotPasswordFailure extends ForgotPasswordViewmodelState {
  final String apiMessage;
  ForgotPasswordFailure(this.apiMessage);
}

final class ForgotPasswordSuccess extends ForgotPasswordViewmodelState {
  final String apiMessage;
  ForgotPasswordSuccess(this.apiMessage);
}
