import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cookiestudio/presentation/onboarding/view/onboarding_view.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/constants_manager.dart';

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
      splashIconSize: 200,
      splash: const Image(
        image: AssetImage(
          ImageAssets.splashLogo,
        ),
      ),
      duration: AppConstants.splashDelay,
      nextScreen: const OnboardingView(),
    );
  }
}
