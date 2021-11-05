import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_palette/locale.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void openUrl(String url, BuildContext context) async {
    if(await canLaunch(url)){
      await launch(url);
    }else{
      Clipboard.setData(ClipboardData(text: url));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${S.of(context).cantOpenUrlString(url)}, ${S.of(context).copiedToClipboardString}'),
          duration: const Duration(seconds: 5),
        )
      );
    }
  }
}