import 'package:shared_preferences/shared_preferences.dart';
class PrefManager {
  final String auth_token = "auth_token";

//set data into shared preferences
  Future<void> setAuthToken(String auth_token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.auth_token, auth_token);
  }

//get value from shared preferences
  Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String auth_token;
    auth_token = pref.getString(this.auth_token) ?? null;
    return auth_token;
  }

  Future<void>clearSharedPreferences() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}