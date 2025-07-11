import 'package:portfolio/exports.dart';

class StorageHelper {
  StorageHelper._();

  // set and get default language
  static setLanguagePrefs(String lang) {
    sl<CacheHelper>().assignData(key: Constants.kLanguage, value: lang);
  }

  // static final String _currentLang = Platform.localeName == 'en_US' ? 'en' : 'ar';
  static final String _currentLang = 'en';

  static String getLanguagePrefs() {
    // if storage is empty? return current system language
    return sl<CacheHelper>().getData(key: Constants.kLanguage) ?? _currentLang;
  }


  static Future<void> clearAllData() async {
    // deleteUserData();
  }
}
