part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {
  abstract final bool colorsListView;
  abstract final bool shadesListView;
  abstract final bool darkTheme;
  abstract final int columnsInGrid;
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
  int get hashCode => colorsListView.hashCode ^ shadesListView.hashCode ^ darkTheme.hashCode ^ columnsInGrid.hashCode;
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
  int get hashCode => colorsListView.hashCode ^ shadesListView.hashCode ^ darkTheme.hashCode ^ columnsInGrid.hashCode;
  @override
  bool operator ==(Object other){
    if(identical(this, other)){
      return true;
    }

    return other is SettingsInitial && hashCode == other.hashCode;
  }
}