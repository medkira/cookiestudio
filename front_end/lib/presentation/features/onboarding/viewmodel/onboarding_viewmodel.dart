// import 'dart:async';

// import 'package:cookiestudio/domain/models.dart';
// import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
// import 'package:cookiestudio/presentation/resources/assets_manager.dart';
// import 'package:cookiestudio/presentation/resources/strings_manager.dart';

// class OnboardingViewModel extends BaseViewModel
//     implements OnboardingViewModelInputs, OnboardingViewModelOutputs {
//   // # stream controllers

//   final StreamController _streamController =
//       StreamController<SliderViewObject>();
//   late final List<SliderObject> slideList;

//   // # OnBoarding ViewModel inputs
//   @override
//   void dispose() {
//     _streamController.close();
//   }

//   @override
//   void start() {
//     slideList = _getSliderDate();
//     _postDataToView();
//   }

//   @override
//   Sink get inputSliderViewObject => _streamController.sink;

//   // # OnBoarding ViewModel outputs

//   @override
//   Stream<SliderViewObject> get outputSliderViewObject =>
//       _streamController.stream.map((slideViewObject) => slideViewObject);

//   // * onboarding private function

//   void _postDataToView() {
//     inputSliderViewObject.add(SliderViewObject(
//         numberOfSlide: slideList.length, sliderObject: slideList));
//   }

//   List<SliderObject> _getSliderDate() => [
//         SliderObject(AppStrings.onBoardingTitle1,
//             AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
//         SliderObject(AppStrings.onBoardingSubTitle2,
//             AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
//         SliderObject(AppStrings.onBoardingSubTitle3,
//             AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
//         SliderObject(AppStrings.onBoardingSubTitle4,
//             AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
//       ];
// }

// abstract class OnboardingViewModelInputs {
//   // * stream controller inputs
//   Sink get inputSliderViewObject;
// }

// abstract class OnboardingViewModelOutputs {
//   // * stream controller output
//   Stream<SliderViewObject> get outputSliderViewObject;
// }
