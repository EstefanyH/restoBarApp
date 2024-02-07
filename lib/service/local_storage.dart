import 'package:restobarapp/global/shared_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setUserName (String username) async {
    await prefs.setString(prefs_username, username);
  }

  static String getUserName () {
    return prefs.getString(prefs_username).toString();
  }

  static Future setParameter(String key, String valor) async {
    await prefs.setString(key, valor);
  }

  static String getParameter(String key) {
    return prefs.getString(key).toString();
  }
}