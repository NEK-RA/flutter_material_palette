import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_palette/locale.dart';

enum ValueType {
  hex,
  rgb,
  flutterShort,
  flutterFull
}

class ColorInfoDialog extends StatelessWidget {
  final String name;
  final String title;
  final int shade;
  final bool isAccent;
  final Color color;
  const ColorInfoDialog({
    Key? key,
    required this.name,
    required this.title,
    required this.shade,
    required this.isAccent,
    required this.color
  }) : super(key: key);

  bool needShade(){
    if(isAccent){
      if(shade == 200){
        return false;
      }else{
        return true;
      }
    }else{
      if(shade==500){
        return false;
      }else{
        return true;
      }
    }
  }

  String getHexValue() => '#${color.value.toRadixString(16).substring(2)}';
  String getRgbValue() => 'rgb(${color.red}, ${color.green}, ${color.blue})';
  String getFlutterShort() => 'Colors.$name${isAccent? 'Accent':''}${needShade() ? '[$shade]': ''}';
  String getFlutterFull() => 'Colors.$name${isAccent? 'Accent':''}.shade$shade';
  

  void copyToClipboard(String value,BuildContext context, ValueType type){
    String message = '';
    switch (type){
      case ValueType.hex:
        message += S.of(context).hexValueOfColorString;
        break;
      case ValueType.rgb:
        message += S.of(context).rgbValueOfColorString;
        break;
      case ValueType.flutterShort:
        message += S.of(context).flutterShortVariantString;
        break;
      case ValueType.flutterFull:
        message += S.of(context).flutterFullVariantString;
        break;
    }
    message +=': $value ';
    message +=S.of(context).copiedToClipboardString;

    context.router.pop();

    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       content: Text(message),
       duration: const Duration(seconds: 3),
     )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      children:[
        Row(
          children: [
            const SizedBox(width: 50.0),
            Expanded(
              child: Card(
                child: const SizedBox(
                  width: 200.0,
                  height: 50.0,
                ),
                color: color,
              ),
            ),
            const SizedBox(width: 50.0),
          ],
        ),
        ListTile(
          title: Text(S.of(context).hexValueOfColorString),
          subtitle: Text(getHexValue()),
          trailing: IconButton(
            onPressed: (){
              copyToClipboard(getHexValue(), context, ValueType.hex);
            },
            icon: const Icon(Icons.copy)
          ),
        ),
        ListTile(
          title: Text(S.of(context).rgbValueOfColorString),
          subtitle: Text(getRgbValue()),
          trailing: IconButton(
            onPressed: (){
              copyToClipboard(getRgbValue(), context, ValueType.rgb);
            },
            icon: const Icon(Icons.copy)
          ),
        ),
        ListTile(
          title: Text(S.of(context).flutterShortVariantString),
          subtitle: Text(getFlutterShort()),
          trailing: IconButton(
            onPressed: (){
              copyToClipboard(getFlutterShort(), context, ValueType.flutterShort);
            },
            icon: const Icon(Icons.copy)
          ),
        ),
        ListTile(
          title: Text(S.of(context).flutterFullVariantString),
          subtitle: Text(getFlutterFull()),
          trailing: IconButton(
            onPressed: (){
              copyToClipboard(getFlutterFull(), context, ValueType.flutterFull);
            },
            icon: const Icon(Icons.copy)
          ),
        )
      ]
    );
  }
}