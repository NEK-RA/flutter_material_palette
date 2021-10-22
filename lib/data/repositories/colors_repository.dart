import 'package:color_palette/l10n/locales.dart';
import 'package:flutter/material.dart' show Colors, Color, MaterialColor, MaterialAccentColor, BuildContext;

class ColorPalette{

  static List<int> get shades => _shades;

  static List<int> get accentShades => _accentShades;

  static List<String> get colorNames => List.from(_colors.keys);

  static List<String> get accentColorNames => List.from(_accentColors.keys);

  static Map<String, MaterialColor> get colors => _colors;

  static Map<String, MaterialAccentColor> get accentColors => _accentColors;

  static bool hasAccentColor(String color) => !['brown','grey','blueGrey'].contains(color) ;

  static AppLocalizations _lc(BuildContext context) => AppLocalizations.of(context)!;

  static Color getColor({
    required String color,
    required int shade
  }){
    if( _colors.containsKey(color) && _shades.contains(shade)){
      return _colors[color]![shade]!;
    }else{
      return _colors['red']![500]!;
    }
  }

  static Color getAccentColor({
    required String color,
    required int shade
  }){
    if(_accentColors.containsKey(color) && _accentShades.contains(shade)){
      return _accentColors[color]![shade]!;
    }else{
      return _accentColors['red']![200]!;
    }
  }

  static String getReadableColorName({
    required String color,
    required BuildContext context,
    bool caseOfColor = false,
    
  }){
    if(!caseOfColor){
      var names = _colorNamesReadable(context);
      if(names.containsKey(color)){
        return names[color]!;
      }else{
        return _lc(context).incorrectColorNameString;
      }
    }else{
      var names = _caseOfColorNamesReadable(context);
      if(names.containsKey(color)){
        return names[color]!;
      }else{
        return _lc(context).incorrectColorNameString;
      }
    }
  }

  static const List<int> _shades = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
  ];

  static const List<int> _accentShades = [
    100,
    200,
    400,
    700
  ];

  static const Map<String, MaterialColor> _colors = {
    'red': Colors.red,
    'pink': Colors.pink,
    'purple': Colors.purple,
    'deepPurple': Colors.deepPurple,
    'indigo': Colors.indigo,
    'blue': Colors.blue,
    'lightBlue': Colors.lightBlue,
    'cyan': Colors.cyan,
    'teal': Colors.teal,
    'green': Colors.green,
    'lightGreen': Colors.lightGreen,
    'lime': Colors.lime,
    'yellow': Colors.yellow,
    'amber': Colors.amber,
    'orange': Colors.orange,
    'deepOrange': Colors.deepOrange,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'blueGrey': Colors.blueGrey
  };

  static const Map<String, MaterialAccentColor> _accentColors = {
    'red': Colors.redAccent,
    'pink': Colors.pinkAccent,
    'purple': Colors.purpleAccent,
    'deepPurple': Colors.deepPurpleAccent,
    'indigo': Colors.indigoAccent,
    'blue': Colors.blueAccent,
    'lightBlue': Colors.lightBlueAccent,
    'cyan': Colors.cyanAccent,
    'teal': Colors.tealAccent,
    'green': Colors.greenAccent,
    'lightGreen': Colors.lightGreenAccent,
    'lime': Colors.limeAccent,
    'yellow': Colors.yellowAccent,
    'amber': Colors.amberAccent,
    'orange': Colors.orangeAccent,
    'deepOrange': Colors.deepOrangeAccent
  };

  static Map<String,String> _colorNamesReadable(BuildContext context){
    return {
      'red': _lc(context).redColor,
      'pink': _lc(context).pinkColor,
      'purple': _lc(context).purpleColor,
      'deepPurple': _lc(context).deepPurpleColor,
      'indigo': _lc(context).indigoColor,
      'blue': _lc(context).blueColor,
      'lightBlue': _lc(context).lightBlueColor,
      'cyan': _lc(context).cyanColor,
      'teal': _lc(context).tealColor,
      'green': _lc(context).greenColor,
      'lightGreen': _lc(context).lightGreenColor,
      'lime': _lc(context).limeColor,
      'yellow': _lc(context).yellowColor,
      'amber': _lc(context).amberColor,
      'orange': _lc(context).orangeColor,
      'deepOrange': _lc(context).deepOrangeColor,
      'brown': _lc(context).brownColor,
      'grey': _lc(context).greyColor,
      'blueGrey': _lc(context).blueGreyColor
    };
  }

  static Map<String,String> _caseOfColorNamesReadable(BuildContext context){
    return {
      'red': _lc(context).ofRedColor,
      'pink': _lc(context).ofPinkColor,
      'purple': _lc(context).ofPurpleColor,
      'deepPurple': _lc(context).ofDeepPurpleColor,
      'indigo': _lc(context).ofIndigoColor,
      'blue': _lc(context).ofBlueColor,
      'lightBlue': _lc(context).ofLightBlueColor,
      'cyan': _lc(context).ofCyanColor,
      'teal': _lc(context).ofTealColor,
      'green': _lc(context).ofGreenColor,
      'lightGreen': _lc(context).ofLightGreenColor,
      'lime': _lc(context).ofLimeColor,
      'yellow': _lc(context).ofYellowColor,
      'amber': _lc(context).ofAmberColor,
      'orange': _lc(context).ofOrangeColor,
      'deepOrange': _lc(context).ofDeepOrangeColor,
      'brown': _lc(context).ofBrownColor,
      'grey': _lc(context).ofGreyColor,
      'blueGrey': _lc(context).ofBlueGreyColor
    };
  }

} 
