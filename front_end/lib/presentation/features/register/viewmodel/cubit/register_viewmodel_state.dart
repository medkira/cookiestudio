part of 'register_viewmodel_cubit.dart';

@immutable
sealed class RegisterViewmodelState {}

final class RegisterInitial extends RegisterViewmodelState {}

final class RegisterLoading extends RegisterViewmodelState {}

final class RegisterFailure extends RegisterViewmodelState {
  final String apiMessage;
  RegisterFailure(this.apiMessage);
}

final class RegisterSuccess extends RegisterViewmodelState {}
