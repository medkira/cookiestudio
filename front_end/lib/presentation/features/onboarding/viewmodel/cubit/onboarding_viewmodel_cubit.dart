import 'package:bloc/bloc.dart';
import 'package:cookiestudio/domain/model/models.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:meta/meta.dart';

part 'onboarding_viewmodel_state.dart';

class OnboardingViewmodelCubit extends Cubit<OnboardingViewmodelState>
    implements BaseViewModel {
  OnboardingViewmodelCubit() : super(OnboardingViewmodelInitial());

  // // # Function that create a SliderViewObject
  // OnboardingViewModelSliderObject _getSliderViewObject() =>
  //     OnboardingViewModelSliderObject(
  //         _getSliderData().length, _getSliderData());

  @override
  void start() {
    emit(OnboardingViewModelSliderObject(
        _getSliderData().length, _getSliderData()));
  }

// # if this a normal networking http req this data will come from the data file
// # [data => repo => viewModel => view]
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingSubTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingSubTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingSubTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
      ];

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
