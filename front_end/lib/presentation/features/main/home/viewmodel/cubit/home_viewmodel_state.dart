part of 'home_viewmodel_cubit.dart';

@immutable
sealed class HomeViewmodelState {}

final class HomeViewmodelInitial extends HomeViewmodelState {}

final class HomeViewmodelLoading extends HomeViewmodelState {}

final class HomeViewmodelFailure extends HomeViewmodelState {}

final class HomeViewmodelSuccess extends HomeViewmodelState {}
