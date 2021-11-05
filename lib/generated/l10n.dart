// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Base colors`
  String get baseColors {
    return Intl.message(
      'Base colors',
      name: 'baseColors',
      desc: 'Title for the app bar on palette_page.dart',
      args: [],
    );
  }

  /// `Shades`
  String get shades {
    return Intl.message(
      'Shades',
      name: 'shades',
      desc:
          'Part of title for the app bar on color_shade_page.dart, another part is in the end of localization file for all the colors in form \'ofNameColor\'',
      args: [],
    );
  }

  /// `shade`
  String get shade {
    return Intl.message(
      'shade',
      name: 'shade',
      desc: '\'shade\' word used inside color_card.dart',
      args: [],
    );
  }

  /// `build`
  String get buildWord {
    return Intl.message(
      'build',
      name: 'buildWord',
      desc:
          'A \'build\' word used to show app version in the settings_page.dart',
      args: [],
    );
  }

  /// `HEX value of color`
  String get hexValueOfColorString {
    return Intl.message(
      'HEX value of color',
      name: 'hexValueOfColorString',
      desc: 'Part of snackbar message for copying color code',
      args: [],
    );
  }

  /// `RGB value of color`
  String get rgbValueOfColorString {
    return Intl.message(
      'RGB value of color',
      name: 'rgbValueOfColorString',
      desc: 'String for color_info_dialog.dart',
      args: [],
    );
  }

  /// `Flutter's short variant`
  String get flutterShortVariantString {
    return Intl.message(
      'Flutter\'s short variant',
      name: 'flutterShortVariantString',
      desc:
          'String for ListTile in color_info_dialog.dart, where the Colors.name[shade] format will be shown',
      args: [],
    );
  }

  /// `Flutter's full variant`
  String get flutterFullVariantString {
    return Intl.message(
      'Flutter\'s full variant',
      name: 'flutterFullVariantString',
      desc:
          'String for ListTile in color_info_dialog.dart, where the Colors.name.shadeN format will be shown',
      args: [],
    );
  }

  /// `copied to clipboard`
  String get copiedToClipboardString {
    return Intl.message(
      'copied to clipboard',
      name: 'copiedToClipboardString',
      desc: 'The last part of snackbar message for copying color code',
      args: [],
    );
  }

  /// `Switch view ( list / grid )`
  String get switchViewTooltip {
    return Intl.message(
      'Switch view ( list / grid )',
      name: 'switchViewTooltip',
      desc:
          'Icon button\'s hint on both palette_page.dart and color_shade_page.dart',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'The \'Settings\' word, used on settings_page.dart',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: 'The \'About\' word, used in settings_page.dart',
      args: [],
    );
  }

  /// `App language`
  String get appLanguageSettingTitle {
    return Intl.message(
      'App language',
      name: 'appLanguageSettingTitle',
      desc: 'Title for the app language ListTile in the settings_page.dart',
      args: [],
    );
  }

  /// `Current language: `
  String get currentLanguageString {
    return Intl.message(
      'Current language: ',
      name: 'currentLanguageString',
      desc:
          'String for the subtitle of ListTile, which contains appLanguageSettingTitle',
      args: [],
    );
  }

  /// `System`
  String get systemWordAdjective {
    return Intl.message(
      'System',
      name: 'systemWordAdjective',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkThemeSettingTitle {
    return Intl.message(
      'Dark theme',
      name: 'darkThemeSettingTitle',
      desc: 'Title of theme switcher',
      args: [],
    );
  }

  /// `Switch between dark and light themes, the default theme is dark`
  String get darkThemeSettingSubtitle {
    return Intl.message(
      'Switch between dark and light themes, the default theme is dark',
      name: 'darkThemeSettingSubtitle',
      desc: 'Subtitle of theme switcher',
      args: [],
    );
  }

  /// `Column count`
  String get columnCountSettingTitle {
    return Intl.message(
      'Column count',
      name: 'columnCountSettingTitle',
      desc:
          'Title of setting which allow to change column count in the grid view',
      args: [],
    );
  }

  /// `Currently between 2 and 3 only, used for both colors and shades grid`
  String get columnCountSettingSubtitle {
    return Intl.message(
      'Currently between 2 and 3 only, used for both colors and shades grid',
      name: 'columnCountSettingSubtitle',
      desc:
          'Title of setting which allow to change column count in the grid view',
      args: [],
    );
  }

  /// `App homepage`
  String get aboutAppHomepage {
    return Intl.message(
      'App homepage',
      name: 'aboutAppHomepage',
      desc:
          'Title of ListTile, which contains link to github repo as subtitle. Used on the settings_page.dart inside of about() function',
      args: [],
    );
  }

  /// `Github-repository`
  String get githubRepoString {
    return Intl.message(
      'Github-repository',
      name: 'githubRepoString',
      desc:
          'String used inside button when error message shown at color_shade_page.dart',
      args: [],
    );
  }

  /// `Version`
  String get aboutAppVersionTitle {
    return Intl.message(
      'Version',
      name: 'aboutAppVersionTitle',
      desc:
          'The \'Version\' word used in the \'About\' section of settings_page.dart, title of corresponding ListTile',
      args: [],
    );
  }

  /// `Tap here to check for updates`
  String get aboutAppVersionSubtitle {
    return Intl.message(
      'Tap here to check for updates',
      name: 'aboutAppVersionSubtitle',
      desc: 'Subtitle of ListTile related to app version.',
      args: [],
    );
  }

  /// `Update found`
  String get updateFoundTitle {
    return Intl.message(
      'Update found',
      name: 'updateFoundTitle',
      desc: 'Title for the update info dialog when update found',
      args: [],
    );
  }

  /// `Published: {date}`
  String publishedAtDate(Object date) {
    return Intl.message(
      'Published: $date',
      name: 'publishedAtDate',
      desc: 'String to display publish date of found update',
      args: [date],
    );
  }

  /// `Pre-Release`
  String get prereleaseWord {
    return Intl.message(
      'Pre-Release',
      name: 'prereleaseWord',
      desc: 'Will be displayed if found update is prerelease',
      args: [],
    );
  }

  /// `Close`
  String get closeWord {
    return Intl.message(
      'Close',
      name: 'closeWord',
      desc: 'Button on update dialog',
      args: [],
    );
  }

  /// `Open`
  String get openWord {
    return Intl.message(
      'Open',
      name: 'openWord',
      desc: 'Button on update dialog',
      args: [],
    );
  }

  /// `Updates not found`
  String get noNewUpdatesTitle {
    return Intl.message(
      'Updates not found',
      name: 'noNewUpdatesTitle',
      desc: '',
      args: [],
    );
  }

  /// `You are using latest version`
  String get usingLatestVersion {
    return Intl.message(
      'You are using latest version',
      name: 'usingLatestVersion',
      desc: 'Text for body of dialog when no updates found',
      args: [],
    );
  }

  /// `Error during check for updates`
  String get updateErrorReceivedTitle {
    return Intl.message(
      'Error during check for updates',
      name: 'updateErrorReceivedTitle',
      desc: 'Title for dialog on any update error',
      args: [],
    );
  }

  /// `Response status: {status}`
  String responseStatus(Object status) {
    return Intl.message(
      'Response status: $status',
      name: 'responseStatus',
      desc:
          'String for displaying response status in dialog from UpdateError object from updates_repository.dart',
      args: [status],
    );
  }

  /// `Response body:\n{body}`
  String responseBody(Object body) {
    return Intl.message(
      'Response body:\n$body',
      name: 'responseBody',
      desc:
          'String for displaying response body in dialog from UpdateError object from updates_repository.dart',
      args: [body],
    );
  }

  /// `Unexpected response!`
  String get unexpectedReponseString {
    return Intl.message(
      'Unexpected response!',
      name: 'unexpectedReponseString',
      desc: '',
      args: [],
    );
  }

  /// `Required JSON fields ({fields}) not found!`
  String requiredFieldsNotFoundString(Object fields) {
    return Intl.message(
      'Required JSON fields ($fields) not found!',
      name: 'requiredFieldsNotFoundString',
      desc:
          'Used to display in UpdateError object from updates_repository.dart',
      args: [fields],
    );
  }

  /// `Doesn't look like JSON object of single release!`
  String get notLikeReleaseJsonString {
    return Intl.message(
      'Doesn\'t look like JSON object of single release!',
      name: 'notLikeReleaseJsonString',
      desc:
          'Used to display in UpdateError object from updates_repository.dart',
      args: [],
    );
  }

  /// `NOT IMPLEMENTED YET`
  String get notImplementedString {
    return Intl.message(
      'NOT IMPLEMENTED YET',
      name: 'notImplementedString',
      desc:
          'String to put into snackbars or somewhere else to notify user that some feature is not implemented yet.',
      args: [],
    );
  }

  /// `Incorrect color name!`
  String get incorrectColorNameString {
    return Intl.message(
      'Incorrect color name!',
      name: 'incorrectColorNameString',
      desc:
          'Used in colors_repository.dart when no color found in created maps',
      args: [],
    );
  }

  /// `Incorrect color specified. If you see this message when tapped some color in app main screen, please open issue at Github repo. Otherwise there's probably error in URL you opened.`
  String get incorrectColorNameMessage {
    return Intl.message(
      'Incorrect color specified. If you see this message when tapped some color in app main screen, please open issue at Github repo. Otherwise there\'s probably error in URL you opened.',
      name: 'incorrectColorNameMessage',
      desc:
          'Error message displayed at color_shade_page.dart when the colorName parameter was not found in keys of ColorPalette.colors map',
      args: [],
    );
  }

  /// `Accent`
  String get accent {
    return Intl.message(
      'Accent',
      name: 'accent',
      desc: '\'Accent\' word used inside color_card.dart',
      args: [],
    );
  }

  /// `Main screen`
  String get goToMainScreen {
    return Intl.message(
      'Main screen',
      name: 'goToMainScreen',
      desc:
          'Text inside button which will redirect to palette_page.dart in case of incorrect color specified for color_shade_page.dart',
      args: [],
    );
  }

  /// `Red`
  String get redColor {
    return Intl.message(
      'Red',
      name: 'redColor',
      desc: 'readable color name of red',
      args: [],
    );
  }

  /// `of Red`
  String get ofRedColor {
    return Intl.message(
      'of Red',
      name: 'ofRedColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Pink`
  String get pinkColor {
    return Intl.message(
      'Pink',
      name: 'pinkColor',
      desc: 'readable color name of pink',
      args: [],
    );
  }

  /// `of pink`
  String get ofPinkColor {
    return Intl.message(
      'of pink',
      name: 'ofPinkColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Purple`
  String get purpleColor {
    return Intl.message(
      'Purple',
      name: 'purpleColor',
      desc: 'readable color name of purple',
      args: [],
    );
  }

  /// `of purple`
  String get ofPurpleColor {
    return Intl.message(
      'of purple',
      name: 'ofPurpleColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Deep Purple`
  String get deepPurpleColor {
    return Intl.message(
      'Deep Purple',
      name: 'deepPurpleColor',
      desc: 'readable color name of deep purple',
      args: [],
    );
  }

  /// `of deep purple`
  String get ofDeepPurpleColor {
    return Intl.message(
      'of deep purple',
      name: 'ofDeepPurpleColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Indigo`
  String get indigoColor {
    return Intl.message(
      'Indigo',
      name: 'indigoColor',
      desc: 'readable color name of indigo',
      args: [],
    );
  }

  /// `of indigo`
  String get ofIndigoColor {
    return Intl.message(
      'of indigo',
      name: 'ofIndigoColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Blue`
  String get blueColor {
    return Intl.message(
      'Blue',
      name: 'blueColor',
      desc: 'readable color name of blue',
      args: [],
    );
  }

  /// `of blue`
  String get ofBlueColor {
    return Intl.message(
      'of blue',
      name: 'ofBlueColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Light Blue`
  String get lightBlueColor {
    return Intl.message(
      'Light Blue',
      name: 'lightBlueColor',
      desc: 'readable color name of light blue',
      args: [],
    );
  }

  /// `of light blue`
  String get ofLightBlueColor {
    return Intl.message(
      'of light blue',
      name: 'ofLightBlueColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Cyan`
  String get cyanColor {
    return Intl.message(
      'Cyan',
      name: 'cyanColor',
      desc: 'readable color name of cyan',
      args: [],
    );
  }

  /// `of cyan`
  String get ofCyanColor {
    return Intl.message(
      'of cyan',
      name: 'ofCyanColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Teal`
  String get tealColor {
    return Intl.message(
      'Teal',
      name: 'tealColor',
      desc: 'readable color name of teal',
      args: [],
    );
  }

  /// `of teal`
  String get ofTealColor {
    return Intl.message(
      'of teal',
      name: 'ofTealColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Green`
  String get greenColor {
    return Intl.message(
      'Green',
      name: 'greenColor',
      desc: 'readable color name of green',
      args: [],
    );
  }

  /// `of green`
  String get ofGreenColor {
    return Intl.message(
      'of green',
      name: 'ofGreenColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Light Green`
  String get lightGreenColor {
    return Intl.message(
      'Light Green',
      name: 'lightGreenColor',
      desc: 'readable color name of light green',
      args: [],
    );
  }

  /// `of light green`
  String get ofLightGreenColor {
    return Intl.message(
      'of light green',
      name: 'ofLightGreenColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Lime`
  String get limeColor {
    return Intl.message(
      'Lime',
      name: 'limeColor',
      desc: 'readable color name of lime',
      args: [],
    );
  }

  /// `of lime`
  String get ofLimeColor {
    return Intl.message(
      'of lime',
      name: 'ofLimeColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Yellow`
  String get yellowColor {
    return Intl.message(
      'Yellow',
      name: 'yellowColor',
      desc: 'readable color name of yellow',
      args: [],
    );
  }

  /// `of yellow`
  String get ofYellowColor {
    return Intl.message(
      'of yellow',
      name: 'ofYellowColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Amber`
  String get amberColor {
    return Intl.message(
      'Amber',
      name: 'amberColor',
      desc: 'readable color name of amber',
      args: [],
    );
  }

  /// `of amber`
  String get ofAmberColor {
    return Intl.message(
      'of amber',
      name: 'ofAmberColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Orange`
  String get orangeColor {
    return Intl.message(
      'Orange',
      name: 'orangeColor',
      desc: 'readable color name of orange',
      args: [],
    );
  }

  /// `of orange`
  String get ofOrangeColor {
    return Intl.message(
      'of orange',
      name: 'ofOrangeColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Deep Orange`
  String get deepOrangeColor {
    return Intl.message(
      'Deep Orange',
      name: 'deepOrangeColor',
      desc: 'readable color name of deep orange',
      args: [],
    );
  }

  /// `of deep orange`
  String get ofDeepOrangeColor {
    return Intl.message(
      'of deep orange',
      name: 'ofDeepOrangeColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Brown`
  String get brownColor {
    return Intl.message(
      'Brown',
      name: 'brownColor',
      desc: 'readable color name of brown',
      args: [],
    );
  }

  /// `of brown`
  String get ofBrownColor {
    return Intl.message(
      'of brown',
      name: 'ofBrownColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Grey`
  String get greyColor {
    return Intl.message(
      'Grey',
      name: 'greyColor',
      desc: 'readable color name of grey',
      args: [],
    );
  }

  /// `of grey`
  String get ofGreyColor {
    return Intl.message(
      'of grey',
      name: 'ofGreyColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }

  /// `Blue Grey`
  String get blueGreyColor {
    return Intl.message(
      'Blue Grey',
      name: 'blueGreyColor',
      desc: 'readable color name of blue grey',
      args: [],
    );
  }

  /// `of blue grey`
  String get ofBlueGreyColor {
    return Intl.message(
      'of blue grey',
      name: 'ofBlueGreyColor',
      desc: 'form of name for using in app bar on the color_shade_page.dart',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
      Locale.fromSubtags(languageCode: 'uk', countryCode: 'UA'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
