import 'package:flutter/cupertino.dart';

import '../models/dark_theme_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferences preferences = DarkThemePreferences();
  late bool _isDarkTheme;

  bool get darkTheme => _isDarkTheme;

  DarkThemeProvider() {
    _isDarkTheme = false;
    _loadTheme();
  }
  _loadTheme() async {
    _isDarkTheme = await preferences.getTheme();
    notifyListeners();
  }

  set darkTheme(bool value) {
    _isDarkTheme = value;
    preferences.setDarkTheme(value);
    notifyListeners();
  }
}
