part of 'profile_viewmodel_cubit.dart';

sealed class ProfileViewmodelState extends Equatable {
  const ProfileViewmodelState();

  @override
  List<Object> get props => [];
}

final class ProfileViewmodelInitial extends ProfileViewmodelState {}

final class LougoutSuccess extends ProfileViewmodelState {}

final class LougoutLoading extends ProfileViewmodelState {}
