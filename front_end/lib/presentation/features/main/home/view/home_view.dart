import 'package:cookiestudio/presentation/common/animation/json_animation.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                "Loading...",
              )
            ],
          ),
        ),
      ),
    );
  }
}
