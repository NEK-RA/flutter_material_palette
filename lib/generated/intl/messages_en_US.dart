// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(url) => "Can\'t open URL: ${url}";

  static String m1(date) => "Published: ${date}";

  static String m2(fields) => "Required JSON fields (${fields}) not found!";

  static String m3(body) => "Response body:\n${body}";

  static String m4(status) => "Response status: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "aboutAppHomepage":
            MessageLookupByLibrary.simpleMessage("App homepage"),
        "aboutAppVersionSubtitle": MessageLookupByLibrary.simpleMessage(
            "Tap here to check for updates"),
        "aboutAppVersionTitle": MessageLookupByLibrary.simpleMessage("Version"),
        "accent": MessageLookupByLibrary.simpleMessage("Accent"),
        "amberColor": MessageLookupByLibrary.simpleMessage("Amber"),
        "appLanguageSettingTitle":
            MessageLookupByLibrary.simpleMessage("App language"),
        "baseColors": MessageLookupByLibrary.simpleMessage("Base colors"),
        "blueColor": MessageLookupByLibrary.simpleMessage("Blue"),
        "blueGreyColor": MessageLookupByLibrary.simpleMessage("Blue Grey"),
        "brownColor": MessageLookupByLibrary.simpleMessage("Brown"),
        "buildWord": MessageLookupByLibrary.simpleMessage("build"),
        "cantOpenUrlString": m0,
        "closeWord": MessageLookupByLibrary.simpleMessage("Close"),
        "columnCountSettingSubtitle": MessageLookupByLibrary.simpleMessage(
            "Currently between 2 and 3 only, used for both colors and shades grid"),
        "columnCountSettingTitle":
            MessageLookupByLibrary.simpleMessage("Column count"),
        "copiedToClipboardString":
            MessageLookupByLibrary.simpleMessage("copied to clipboard"),
        "currentLanguageString":
            MessageLookupByLibrary.simpleMessage("Current language: "),
        "cyanColor": MessageLookupByLibrary.simpleMessage("Cyan"),
        "darkThemeSettingSubtitle": MessageLookupByLibrary.simpleMessage(
            "Switch between dark and light themes, the default theme is dark"),
        "darkThemeSettingTitle":
            MessageLookupByLibrary.simpleMessage("Dark theme"),
        "deepOrangeColor": MessageLookupByLibrary.simpleMessage("Deep Orange"),
        "deepPurpleColor": MessageLookupByLibrary.simpleMessage("Deep Purple"),
        "flutterFullVariantString":
            MessageLookupByLibrary.simpleMessage("Flutter\'s full variant"),
        "flutterShortVariantString":
            MessageLookupByLibrary.simpleMessage("Flutter\'s short variant"),
        "githubRepoString":
            MessageLookupByLibrary.simpleMessage("Github-repository"),
        "goToMainScreen": MessageLookupByLibrary.simpleMessage("Main screen"),
        "greenColor": MessageLookupByLibrary.simpleMessage("Green"),
        "greyColor": MessageLookupByLibrary.simpleMessage("Grey"),
        "hexValueOfColorString":
            MessageLookupByLibrary.simpleMessage("HEX value of color"),
        "incorrectColorNameMessage": MessageLookupByLibrary.simpleMessage(
            "Incorrect color specified. If you see this message when tapped some color in app main screen, please open issue at Github repo. Otherwise there\'s probably error in URL you opened."),
        "incorrectColorNameString":
            MessageLookupByLibrary.simpleMessage("Incorrect color name!"),
        "indigoColor": MessageLookupByLibrary.simpleMessage("Indigo"),
        "lightBlueColor": MessageLookupByLibrary.simpleMessage("Light Blue"),
        "lightGreenColor": MessageLookupByLibrary.simpleMessage("Light Green"),
        "limeColor": MessageLookupByLibrary.simpleMessage("Lime"),
        "noNewUpdatesTitle":
            MessageLookupByLibrary.simpleMessage("Updates not found"),
        "notImplementedString":
            MessageLookupByLibrary.simpleMessage("NOT IMPLEMENTED YET"),
        "notLikeReleaseJsonString": MessageLookupByLibrary.simpleMessage(
            "Doesn\'t look like JSON object of single release!"),
        "ofAmberColor": MessageLookupByLibrary.simpleMessage("of amber"),
        "ofBlueColor": MessageLookupByLibrary.simpleMessage("of blue"),
        "ofBlueGreyColor": MessageLookupByLibrary.simpleMessage("of blue grey"),
        "ofBrownColor": MessageLookupByLibrary.simpleMessage("of brown"),
        "ofCyanColor": MessageLookupByLibrary.simpleMessage("of cyan"),
        "ofDeepOrangeColor":
            MessageLookupByLibrary.simpleMessage("of deep orange"),
        "ofDeepPurpleColor":
            MessageLookupByLibrary.simpleMessage("of deep purple"),
        "ofGreenColor": MessageLookupByLibrary.simpleMessage("of green"),
        "ofGreyColor": MessageLookupByLibrary.simpleMessage("of grey"),
        "ofIndigoColor": MessageLookupByLibrary.simpleMessage("of indigo"),
        "ofLightBlueColor":
            MessageLookupByLibrary.simpleMessage("of light blue"),
        "ofLightGreenColor":
            MessageLookupByLibrary.simpleMessage("of light green"),
        "ofLimeColor": MessageLookupByLibrary.simpleMessage("of lime"),
        "ofOrangeColor": MessageLookupByLibrary.simpleMessage("of orange"),
        "ofPinkColor": MessageLookupByLibrary.simpleMessage("of pink"),
        "ofPurpleColor": MessageLookupByLibrary.simpleMessage("of purple"),
        "ofRedColor": MessageLookupByLibrary.simpleMessage("of Red"),
        "ofTealColor": MessageLookupByLibrary.simpleMessage("of teal"),
        "ofYellowColor": MessageLookupByLibrary.simpleMessage("of yellow"),
        "openWord": MessageLookupByLibrary.simpleMessage("Open"),
        "orangeColor": MessageLookupByLibrary.simpleMessage("Orange"),
        "pinkColor": MessageLookupByLibrary.simpleMessage("Pink"),
        "prereleaseWord": MessageLookupByLibrary.simpleMessage("Pre-Release"),
        "publishedAtDate": m1,
        "purpleColor": MessageLookupByLibrary.simpleMessage("Purple"),
        "redColor": MessageLookupByLibrary.simpleMessage("Red"),
        "requiredFieldsNotFoundString": m2,
        "responseBody": m3,
        "responseStatus": m4,
        "rgbValueOfColorString":
            MessageLookupByLibrary.simpleMessage("RGB value of color"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "shade": MessageLookupByLibrary.simpleMessage("shade"),
        "shades": MessageLookupByLibrary.simpleMessage("Shades"),
        "switchViewTooltip":
            MessageLookupByLibrary.simpleMessage("Switch view ( list / grid )"),
        "systemWordAdjective": MessageLookupByLibrary.simpleMessage("System"),
        "tealColor": MessageLookupByLibrary.simpleMessage("Teal"),
        "unexpectedReponseString":
            MessageLookupByLibrary.simpleMessage("Unexpected response!"),
        "updateErrorReceivedTitle": MessageLookupByLibrary.simpleMessage(
            "Error during check for updates"),
        "updateFoundTitle":
            MessageLookupByLibrary.simpleMessage("Update found"),
        "usingLatestVersion": MessageLookupByLibrary.simpleMessage(
            "You are using latest version"),
        "yellowColor": MessageLookupByLibrary.simpleMessage("Yellow")
      };
}
