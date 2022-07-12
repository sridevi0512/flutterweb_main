import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Future<SharedPreferences> get _instance async =>
      mSharedPrefs = await SharedPreferences.getInstance();
  static SharedPreferences? mSharedPrefs;

  static Future<SharedPreferences?> init() async {
    mSharedPrefs = await _instance;
    return mSharedPrefs;
  }

  static String getUserId(String userId, [String? defValue]) {
    return mSharedPrefs?.getString(userId) ?? defValue ?? "";

  }

  static Future<bool> setUserId(String userId, String value) async {
    var prefs = await _instance;
    return prefs.setString(userId, value);
  }

  static String getUserToken(String userToken, [String? defValue]) {
    return mSharedPrefs?.getString(userToken) ?? defValue ?? "";

  }

  static Future<bool> setUserToken(String userToken, String value) async {
    var prefs = await _instance;
    return prefs.setString(userToken, value);
  }

}