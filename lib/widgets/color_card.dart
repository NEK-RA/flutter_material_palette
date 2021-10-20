import 'package:flutter/material.dart';
import 'package:color_palette/data/repositories/colors_repository.dart';

class ColorCard extends StatelessWidget {
  final String name;
  final int shade;
  final bool withHex;
  final Color colorObject;
  final bool isAccent;
  final bool isVertical;

  ColorCard({Key? key, required this.name, this.shade = 500, this.withHex = false, this.isAccent = false, this.isVertical = false})
      : colorObject = isAccent ? 
        ColorPalette.getAccentColor(color: name, shade: shade) : 
        ColorPalette.getColor(color: name, shade: shade), 
      super(key: key);

  Widget _colorTitle(String name, int color){
    String hex = '#${color.toRadixString(16).substring(2)}';
    String colorName = name[0].toUpperCase()+name.substring(1);
    TextStyle textStyle = TextStyle(
      color: colorObject.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      fontSize: 20
    );
    if (withHex){
      if(isVertical){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isAccent) Text('Accent', style: textStyle),
            Text('shade$shade', style: textStyle),
            Text(hex, style: textStyle)
          ],
        );
      }else{
        return Row(
          children: [
            Text('${isAccent? 'Accent, ':'' }shade$shade', style: textStyle),
            const Spacer(),
            Text(hex, style: textStyle)
          ],
        );
      }
    }else{
      return Text(colorName, style: textStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: isVertical ? const EdgeInsets.all(8) : const EdgeInsets.all(16.0),
        child: Center(
          child: _colorTitle(name, colorObject.value)
        ),
      ),
      color: colorObject,

    );
  }
}
