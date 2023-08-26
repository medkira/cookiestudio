part of 'onboarding_viewmodel_cubit.dart';

@immutable
sealed class OnboardingViewmodelState {}

final class OnboardingViewmodelInitial extends OnboardingViewmodelState {}

final class OnboardingViewModelSliderObject extends OnboardingViewmodelState {
  final int numberOfSlide;
  final List<SliderObject> sliderObject;
  final SliderViewObject sliderViewObject;
  OnboardingViewModelSliderObject(this.numberOfSlide, this.sliderObject)
      : sliderViewObject = SliderViewObject(
          numberOfSlide: numberOfSlide,
          sliderObject: sliderObject,
        );
}
