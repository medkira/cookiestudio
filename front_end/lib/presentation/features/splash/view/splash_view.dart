import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/presentation/features/login/view/login_view.dart';
import 'package:cookiestudio/presentation/features/main/main_view.dart';
import 'package:cookiestudio/presentation/features/onboarding/view/onboarding_view.dart';
import 'package:cookiestudio/presentation/features/splash/viewmodel/cubit/splash_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/constants_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: lightColorScheme.background,
      splashIconSize: AppSize.s200,
      splash: const Image(
        image: AssetImage(
          ImageAssets.splashLogo,
        ),
      ),
      duration: AppConstants.splashDelay,
      nextScreen: const NextScreen(),
    );
  }
}

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final SplashViewmodelCubit splashViewmodel = SplashViewmodelCubit();

  _bind() {
    splashViewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashViewmodel,
      child: BlocBuilder<SplashViewmodelCubit, SplashViewmodelState>(
        builder: (context, state) {
          if (state is UserloggedIn) {
            return const MainView();
          } else if (state is OnBoardingScreenNotViewed) {
            return const OnboardingView();
          } else {
            initLoginModule();
            return const LoginView();
          }
        },
      ),
    );
  }
}
