part of 'splash_viewmodel_cubit.dart';

@immutable
sealed class SplashViewmodelState {}

final class SplashViewmodelInitial extends SplashViewmodelState {}

final class UserloggedIn extends SplashViewmodelState {}

final class OnBoardingScreenNotViewed extends SplashViewmodelState {}
