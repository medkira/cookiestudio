import 'package:cookiestudio/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefs_key_language = "PREFS_KEY_LANG";
const String prefs_key_onboarding_screen_view =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEW";
const String prefs_key_is_user_logged_in = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // ? language

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefs_key_language);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default language
      return LanguageType.ENGLISH.getValue();
    }
  }

  // ? on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefs_key_onboarding_screen_view, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefs_key_onboarding_screen_view) ??
        false;
  }

  // ? login user logged in

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefs_key_is_user_logged_in, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefs_key_is_user_logged_in) ?? false;
  }

// ? logout user

  Future<void> setUserLoggedOut() async {
    _sharedPreferences.setBool(prefs_key_is_user_logged_in, false);
  }
}
