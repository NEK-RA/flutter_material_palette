import 'package:shared_preferences/shared_preferences.dart';

class SettingsKeys {
  static const String colorsListViewKey = 'colorsListView';
  static const String shadesListViewKey = 'shadesListView';
  static const String darkThemeKey = 'darkTheme';
  static const String columnsInGridKey= 'columnsInGrid';
  static const String languageKey = 'language';
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

  int get columnsInGrid => prefs.getInt(SettingsKeys.columnsInGridKey) ?? 2;
  set columnsInGrid(int value) => (value==2 || value ==3) ? prefs.setInt(SettingsKeys.columnsInGridKey, value) : prefs.setInt(SettingsKeys.columnsInGridKey, 2);

  bool get isLocaleDefined => prefs.containsKey(SettingsKeys.languageKey);
  String get language => prefs.getString(SettingsKeys.languageKey) ?? 'en_US';
  set language(String value) => prefs.setString(SettingsKeys.languageKey, value);
  void resetLanguage() => prefs.remove(SettingsKeys.languageKey);
}