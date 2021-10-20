import 'package:shared_preferences/shared_preferences.dart';

class SettingsKeys {
  static const String colorsListViewKey = 'colorsListView';
  static const String shadesListViewKey = 'shadesListView';
  static const String darkThemeKey = 'darkTheme';
}

class SharedSettings{

  final SharedPreferences prefs; 

  SharedSettings({
    required this.prefs
  });

  bool get colorsListView => prefs.getBool(SettingsKeys.colorsListViewKey) ?? true;
  set colorsListView(bool value) => prefs.setBool(SettingsKeys.colorsListViewKey, value);

  bool get shadesListView => prefs.getBool(SettingsKeys.shadesListViewKey) ?? true;
  set shadesListView(bool value) => prefs.setBool(SettingsKeys.shadesListViewKey, value);

  bool get darkTheme => prefs.getBool(SettingsKeys.darkThemeKey) ?? true;
  set darkTheme(bool value) => prefs.setBool(SettingsKeys.darkThemeKey, value);
}