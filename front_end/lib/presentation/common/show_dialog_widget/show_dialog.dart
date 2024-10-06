import 'package:cookiestudio/presentation/common/animation/json_animation.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ShowDialogResponse {
  static Future<void> showFailureDialogJsonAnimation(
      BuildContext context, String apiMessage) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: AppSize.s380,
            child: Column(
              children: [
                getAnimatedImage(JsonAssets.error),
                const SizedBox(height: AppSize.s20),
                Text(
                  textAlign: TextAlign.center,
                  apiMessage,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(AppStrings.ok))
          ],
        );
      },
    );
  }

  static Future<void> showSuccessDialogJsonAnimation(BuildContext context,
      {String apiMessage = "", bool repeatAnimation = true}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: AppSize.s380,
            child: Column(
              children: [
                getAnimatedImage(JsonAssets.success,
                    repeatAnimation: repeatAnimation),
                const SizedBox(height: AppSize.s20),
                Text(
                  textAlign: TextAlign.center,
                  apiMessage,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(AppStrings.ok))
          ],
        );
      },
    );
  }
}
