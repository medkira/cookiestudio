import 'package:cookiestudio/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefs_key_language = "PREFS_KEY_LAN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefs_key_language);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default language
      return LanguageType.ENGLISH.getValue();
    }
  }
}
