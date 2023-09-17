import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getAnimatedImage(String animationName) {
  return SizedBox(
    height: AppSize.s250,
    width: AppSize.s250,
    child: Lottie.asset(animationName),
  );
}
