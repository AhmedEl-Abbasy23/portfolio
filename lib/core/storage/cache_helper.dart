import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences? _sharedPreferences;
  static CacheHelper? _instance;

  CacheHelper._(this._sharedPreferences);

  static Future<CacheHelper> getInstance() async {
    _instance ??= CacheHelper._(await SharedPreferences.getInstance());
    return _instance!;
  }

  clearCache({required String key, context}) {
    _sharedPreferences!.remove(key);
    _sharedPreferences.clear();
  }

  assignData({
    required String key,
    required dynamic value,
  }) async {
    return await _sharedPreferences?.setString(key, value);
  }

  assignIntegerData({
    required String key,
    required dynamic value,
  }) async {
    return await _sharedPreferences?.setInt(key, value);
  }

  assignBoolData({
    required String key,
    required dynamic value,
  }) async {
    return await _sharedPreferences?.setBool(key, value);
  }

  assignListOfStringsData({
    required String key,
    required dynamic value,
  }) async {
    return await _sharedPreferences?.setStringList(key, value);
  }

  getData({required String key}) {
    return _sharedPreferences?.get(key);
  }
}
