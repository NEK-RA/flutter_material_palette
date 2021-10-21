import 'package:flutter/material.dart' show Colors, Color, MaterialColor, MaterialAccentColor;

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
    required String color
  }){
    if(_colorNamesReadable.containsKey(color)){
      return _colorNamesReadable[color]!;
    }else{
      return 'Incorrect color requested';
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

  static const Map<String,String> _colorNamesReadable = {
    'red': 'Red',
    'pink': 'Pink',
    'purple': 'Purple',
    'deepPurple': 'Deep Purple',
    'indigo': 'Indigo',
    'blue': 'Blue',
    'lightBlue': 'Light Blue',
    'cyan': 'Cyan',
    'teal': 'Teal',
    'green': 'Green',
    'lightGreen': 'Light Green',
    'lime': 'Lime',
    'yellow': 'Yellow',
    'amber': 'Amber',
    'orange': 'Orange',
    'deepOrange': 'Deep Orange',
    'brown': 'Brown',
    'grey': 'Grey',
    'blueGrey': 'Blue Grey'
  };

} 
