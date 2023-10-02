import 'package:cookiestudio/presentation/common/animation/json_animation.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class FullScreenErrorResponse {
  static Widget fullScreenError(
      VoidCallback retryActionFunction, String apiMessage) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getAnimatedImage(JsonAssets.loading),
                    Text(
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                      apiMessage,
                    ),
                    const SizedBox(height: AppSize.s32),
                    SizedBox(
                      width: AppSize.s200,
                      height: AppSize.s50,
                      child: ElevatedButton(
                        onPressed: retryActionFunction,
                        child: const Text(AppStrings.retry),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
