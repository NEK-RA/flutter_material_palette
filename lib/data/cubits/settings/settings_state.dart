part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {
  abstract final bool colorsListView;
  abstract final bool shadesListView;
  abstract final bool darkTheme;
  abstract final int columnsInGrid;
  abstract final bool languageChanged;
  abstract final Locale locale;
}

class SettingsInitial extends SettingsState {
  
  final SharedSettings settings;

  SettingsInitial(SharedPreferences prefs): settings = SharedSettings(prefs: prefs);

  @override
  bool get colorsListView => settings.colorsListView;
  @override
  bool get shadesListView => settings.shadesListView;
  @override
  bool get darkTheme => settings.darkTheme;
  @override
  int get columnsInGrid => settings.columnsInGrid;
  @override
  bool get languageChanged => settings.isLocaleDefined;
  @override
  Locale get locale => Locale(settings.languageCode);

  @override
  int get hashCode => colorsListView.hashCode ^ shadesListView.hashCode ^ darkTheme.hashCode ^ columnsInGrid.hashCode ^ languageChanged.hashCode ^ locale.hashCode;
  @override
  bool operator ==(Object other){
    if(identical(this, other)){
      return true;
    }

    return other is SettingsInitial && hashCode == other.hashCode;
  }
}

class SettingsChanged extends SettingsState{

  final SharedSettings settings;

  SettingsChanged(SharedPreferences prefs): settings = SharedSettings(prefs: prefs);
  @override
  bool get colorsListView => settings.colorsListView;
  @override
  bool get shadesListView => settings.shadesListView;
  @override
  bool get darkTheme => settings.darkTheme;
  @override
  int get columnsInGrid => settings.columnsInGrid;
  @override
  bool get languageChanged => settings.isLocaleDefined;
  @override
  Locale get locale => Locale(settings.languageCode);

  @override
  int get hashCode => colorsListView.hashCode ^ shadesListView.hashCode ^ darkTheme.hashCode ^ columnsInGrid.hashCode ^ languageChanged.hashCode ^ locale.hashCode;
  @override
  bool operator ==(Object other){
    if(identical(this, other)){
      return true;
    }

    return other is SettingsInitial && hashCode == other.hashCode;
  }
}