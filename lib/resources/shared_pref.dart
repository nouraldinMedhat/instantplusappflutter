import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static Future<void> saveToken(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('access_token', token);
  }

  static Future<String?> readToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('access_token');
  }

  static Future<void> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('access_token');
  }

  static Future<bool> check() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey('access_token');
  }

  static Future<bool> checkLanguage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey('language');
  }

  static Future<void> setLanguage(String language) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('language', language);
  }

  static Future<String?> getLanguage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('language');
  }
}
