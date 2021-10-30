import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:material_palette/data/models/settings.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {

  SharedPreferences prefs;

  SettingsCubit(this.prefs):super(SettingsInitial(prefs));

  void switchColorsView(){
    SettingsChanged newState = SettingsChanged(prefs);
    bool oldValue = state.colorsListView;
    newState.settings.colorsListView = !oldValue;
    emit(newState);
  }

  void switchShadesView(){
    SettingsChanged newState = SettingsChanged(prefs);
    bool oldValue = state.shadesListView;
    newState.settings.shadesListView = !oldValue;
    emit(newState);
  }

  void switchTheme(){
    SettingsChanged newState = SettingsChanged(prefs);
    bool oldValue = state.darkTheme;
    newState.settings.darkTheme = !oldValue;
    emit(newState);
  }

  void setColumnsCount(int value){
    SettingsChanged newState = SettingsChanged(prefs);
    newState.settings.columnsInGrid = value;
    emit(newState);
  }

  void changeLanguage(String value){
    SettingsChanged newState = SettingsChanged(prefs);
    newState.settings.language = value;
    emit(newState);
  }

  void useSystemLanguage(){
    SettingsChanged newState = SettingsChanged(prefs);
    newState.settings.resetLanguage();
    emit(newState);
  }

}
