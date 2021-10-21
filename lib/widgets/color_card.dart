import 'package:flutter/material.dart';
import 'package:color_palette/data/repositories/colors_repository.dart';
import 'package:flutter/services.dart';

class ColorCard extends StatelessWidget {
  final String name;
  final int shade;
  final bool withHex;
  final Color colorObject;
  final bool isAccent;
  final bool isVertical;
  final bool pressable;

  ColorCard({Key? key, required this.name, this.shade = 500, this.withHex = false, this.isAccent = false, this.isVertical = false, this.pressable = false})
      : colorObject = isAccent ? 
          ColorPalette.getAccentColor(color: name, shade: shade) : 
          ColorPalette.getColor(color: name, shade: shade),
        super(key: key);

  Widget _colorTitle(String name, int color){
    String hex = '#${color.toRadixString(16).substring(2)}';
    String colorName = ColorPalette.getReadableColorName(color: name);
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
      if(isVertical){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...splitedColorName()
          ],
        );
      }else{
        return Text(colorName, style: textStyle);
      }
    }
  }

  List<Widget> splitedColorName(){
    String nameStr = ColorPalette.getReadableColorName(color: name);
    return List.from(
      nameStr.split(' ').map((String word) => Text(
        word,
        style: TextStyle(
          color: colorObject.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          fontSize: 20
        )
      ))
    );
  }

  String getHex () => '#${colorObject.value.toRadixString(16).substring(2)}';

  String snackbarMessage(){
    String message = 'HEX value of color: ';
    message += ColorPalette.getReadableColorName(color: name);
    message += '\'s shade $shade copied to clipboard';
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: isVertical ? const EdgeInsets.all(8) : const EdgeInsets.all(16.0),
          child: Center(
            child: _colorTitle(name, colorObject.value)
          ),
        ),
        color: colorObject,
    
      ),
      onTap: pressable ? (){
        splitedColorName();
        Clipboard.setData(ClipboardData(text: getHex()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMessage()),
            duration: const Duration(seconds: 3),
          )
        );
      } : null,
    );
  }
}
