import 'package:cookiestudio/app/app_prefs.dart';
import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/domain/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/routes_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../viewmodel/cubit/onboarding_viewmodel_cubit.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingViewmodelCubit viewModel = OnboardingViewmodelCubit();

  final AppPreferences _appPreferences = instance<AppPreferences>();
  void bind() {
    // set that user already viewed onboarding screen once
    _appPreferences.setOnBoardingScreenViewed();
    viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    // # create instance of viewmodel "create a cube".

    return BlocProvider(
      create: (context) => viewModel,
      child: ContentWidget(context: context),
    );
  }

  // # Call the _bind() method here to start a bind between the the view and the viewwmodel.
  // # will run  once when the widget is built.
  @override
  void initState() {
    bind();
    super.initState();
  }
}

class ContentWidget extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  final BuildContext context;
  ContentWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingViewmodelCubit, OnboardingViewmodelState>(
      builder: (context, state) {
        return _getContentWidget(
            ((state as OnboardingViewModelSliderObject).sliderViewObject));
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: lightColorScheme.background,
        appBar: AppBar(
          backgroundColor: lightColorScheme.background,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: lightColorScheme.background,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numberOfSlide,
          itemBuilder: ((context, index) {
            return OnBoardingPage(
                sliderObject: sliderViewObject.sliderObject[index]);
          }),
        ),
        bottomSheet: Container(
          color: lightColorScheme.background,
          height: AppSize.s120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.pushReplacementNamed(context, Routes.loginRoute);
                      Navigator.pushNamed(context, Routes.loginRoute);
                      // Get.toNamed(Routes.loginRoute);
                    },
                    child: const Text(
                      AppStrings.skip,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s8),
              Container(
                color: lightColorScheme.primary,
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: lightColorScheme.onPrimary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p18,
                      ),
                      child: SmoothPageIndicator(
                        effect: SlideEffect(
                          activeDotColor: lightColorScheme.onPrimary,
                          spacing: AppSize.s14,
                        ),
                        controller: _pageController,
                        count: sliderViewObject.numberOfSlide,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: lightColorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // @override
    // void dispose() {
    //   _viewModel.dispose();
    //   super.dispose();
    // }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage({super.key, required this.sliderObject});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(
          sliderObject.image,
          height: AppSize.s250,
          width: AppSize.s250,
        ),
      ],
    );
  }
}








// class OnboardingView extends StatefulWidget {
//   const OnboardingView({super.key});

//   @override
//   State<OnboardingView> createState() => _OnboardingViewState();
// }

// class _OnboardingViewState extends State<OnboardingView> {
//   // # create instance of viewmodel 
//   final OnboardingViewmodel _viewModel = OnboardingViewmodel();

//   _bind() {
//     _viewModel.start();
//   }

//   @override
//   void initState() {
//     _bind();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _viewModel,
//       child: ContentWidget(context: context),
//     );
//   }
// }
