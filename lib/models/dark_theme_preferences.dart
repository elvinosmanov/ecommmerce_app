import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const THEME_STATUS = "THEME_STATUS";

  setDarkTheme(bool darkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_STATUS, darkTheme);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
