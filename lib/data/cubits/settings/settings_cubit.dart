import 'package:bloc/bloc.dart';
import 'package:color_palette/data/models/settings.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {

  SharedPreferences prefs;

  SettingsCubit(this.prefs):super(SettingsInitial(prefs));

  void switchColorsView(){
    SettingsChanged newState = SettingsChanged(prefs);
    if (state is SettingsInitial){
      bool oldValue = (state as SettingsInitial).colorsListView;
      newState.settings.colorsListView = !oldValue;
    }else{
      bool oldValue = (state as SettingsChanged).colorsListView;
      newState.settings.colorsListView = !oldValue; 
    }
    emit(newState);
  }

  void switchShadesView(){
    SettingsChanged newState = SettingsChanged(prefs);
    if (state is SettingsInitial){
      bool oldValue = (state as SettingsInitial).shadesListView;
      newState.settings.shadesListView = !oldValue;
    }else{
      bool oldValue = (state as SettingsChanged).shadesListView;
      newState.settings.shadesListView = !oldValue; 
    }
    emit(newState);
  }

  void switchTheme(){
    SettingsChanged newState = SettingsChanged(prefs);
    if (state is SettingsInitial){
      bool oldValue = (state as SettingsInitial).settings.darkTheme;
      newState.settings.darkTheme = !oldValue;
    }else{
      bool oldValue = (state as SettingsChanged).settings.darkTheme;
      newState.settings.darkTheme = !oldValue; 
    }
    emit(newState);
  }

}
