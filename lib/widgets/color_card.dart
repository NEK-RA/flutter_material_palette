import 'package:material_palette/locale.dart';
import 'package:flutter/material.dart';
import 'package:material_palette/data/repositories/colors_repository.dart';
import 'package:material_palette/widgets/color_info_dialog.dart';

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

  Widget _colorTitle(String name, int color, BuildContext context){
    String hex = '#${color.toRadixString(16).substring(2)}';
    String colorName = ColorPalette.getReadableColorName(color: name, context: context);
    TextStyle textStyle = TextStyle(
      color: colorObject.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      fontSize: 20
    );
    if (withHex){
      if(isVertical){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isAccent) Text(S.of(context).accent, style: textStyle),
            Text(S.of(context).shade + shade.toString(), style: textStyle),
            Text(hex, style: textStyle)
          ],
        );
      }else{
        return Row(
          children: [
            Text('${isAccent? S.of(context).accent + ', ': '' }${S.of(context).shade}$shade', style: textStyle),
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
            ...splitedColorName(context)
          ],
        );
      }else{
        return Text(colorName, style: textStyle);
      }
    }
  }

  List<Widget> splitedColorName(BuildContext context){
    String nameStr = ColorPalette.getReadableColorName(color: name, context: context);
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: isVertical ? const EdgeInsets.all(8) : const EdgeInsets.all(16.0),
          child: Center(
            child: _colorTitle(name, colorObject.value, context)
          ),
        ),
        color: colorObject,
    
      ),
      onTap: pressable ? (){
        showColorInfo(context);
      } : null,
    );
  }

  void showColorInfo(BuildContext context){
    String dialogTitle = '${ColorPalette.getReadableColorName(color: name, context: context)}, ${isAccent? S.of(context).accent+', ': ''}${S.of(context).shade} $shade';
    showDialog(
      context: context,
      builder: (context){
        return ColorInfoDialog(
          name: name,
          title: dialogTitle,
          shade: shade,
          isAccent: isAccent,
          color: colorObject
        );
      }
    );
  }
}
