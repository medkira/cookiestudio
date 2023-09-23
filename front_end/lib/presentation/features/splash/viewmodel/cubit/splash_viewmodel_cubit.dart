import 'package:bloc/bloc.dart';
import 'package:cookiestudio/app/app_prefs.dart';
import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:meta/meta.dart';

part 'splash_viewmodel_state.dart';

class SplashViewmodelCubit extends Cubit<SplashViewmodelState>
    implements BaseViewModel {
  SplashViewmodelCubit() : super(SplashViewmodelInitial());

  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void dispose() {}

  @override
  void start() {
    getFirstScreen();
  }

  getFirstScreen() {
    _appPreferences.isUserLoggedIn().then(
      (isUserLoggedIn) {
        if (isUserLoggedIn) {
          emit(UserloggedIn());
        } else {
          _appPreferences.isOnBoardingScreenViewed().then(
            (isOnBoardingScreenViewed) {
              if (isOnBoardingScreenViewed == false) {
                emit(OnBoardingScreenNotViewed());
              }
            },
          );
        }
      },
    );
  }
}
