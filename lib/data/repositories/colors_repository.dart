import 'package:material_palette/locale.dart';
import 'package:flutter/material.dart' show Colors, Color, MaterialColor, MaterialAccentColor, BuildContext;

class ColorPalette{

  static List<int> get shades => _shades;

  static List<int> get accentShades => _accentShades;

  static List<String> get colorNames => List.from(_colors.keys);

  static List<String> get accentColorNames => List.from(_accentColors.keys);

  static Map<String, MaterialColor> get colors => _colors;

  static Map<String, MaterialAccentColor> get accentColors => _accentColors;

  static bool hasAccentColor(String color) => !['brown','grey','blueGrey'].contains(color) ;

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
        return S.of(context).incorrectColorNameString;
      }
    }else{
      var names = _caseOfColorNamesReadable(context);
      if(names.containsKey(color)){
        return names[color]!;
      }else{
        return S.of(context).incorrectColorNameString;
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
      'red': S.of(context).redColor,
      'pink': S.of(context).pinkColor,
      'purple': S.of(context).purpleColor,
      'deepPurple': S.of(context).deepPurpleColor,
      'indigo': S.of(context).indigoColor,
      'blue': S.of(context).blueColor,
      'lightBlue': S.of(context).lightBlueColor,
      'cyan': S.of(context).cyanColor,
      'teal': S.of(context).tealColor,
      'green': S.of(context).greenColor,
      'lightGreen': S.of(context).lightGreenColor,
      'lime': S.of(context).limeColor,
      'yellow': S.of(context).yellowColor,
      'amber': S.of(context).amberColor,
      'orange': S.of(context).orangeColor,
      'deepOrange': S.of(context).deepOrangeColor,
      'brown': S.of(context).brownColor,
      'grey': S.of(context).greyColor,
      'blueGrey': S.of(context).blueGreyColor
    };
  }

  static Map<String,String> _caseOfColorNamesReadable(BuildContext context){
    return {
      'red': S.of(context).ofRedColor,
      'pink': S.of(context).ofPinkColor,
      'purple': S.of(context).ofPurpleColor,
      'deepPurple': S.of(context).ofDeepPurpleColor,
      'indigo': S.of(context).ofIndigoColor,
      'blue': S.of(context).ofBlueColor,
      'lightBlue': S.of(context).ofLightBlueColor,
      'cyan': S.of(context).ofCyanColor,
      'teal': S.of(context).ofTealColor,
      'green': S.of(context).ofGreenColor,
      'lightGreen': S.of(context).ofLightGreenColor,
      'lime': S.of(context).ofLimeColor,
      'yellow': S.of(context).ofYellowColor,
      'amber': S.of(context).ofAmberColor,
      'orange': S.of(context).ofOrangeColor,
      'deepOrange': S.of(context).ofDeepOrangeColor,
      'brown': S.of(context).ofBrownColor,
      'grey': S.of(context).ofGreyColor,
      'blueGrey': S.of(context).ofBlueGreyColor
    };
  }

} 
