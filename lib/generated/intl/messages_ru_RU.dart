// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru_RU locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru_RU';

  static String m0(url) => "Не удается открыть: ${url}";

  static String m1(date) => "Выпущено: ${date}";

  static String m2(fields) => "Необходимые поля JSON(${fields}) не найдены!";

  static String m3(body) => "Тело ответа:\n${body}";

  static String m4(status) => "Статус ответа: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("О приложении"),
        "aboutAppHomepage":
            MessageLookupByLibrary.simpleMessage("Домашняя страница"),
        "aboutAppVersionSubtitle": MessageLookupByLibrary.simpleMessage(
            "Нажмите для проверки обновлений"),
        "aboutAppVersionTitle": MessageLookupByLibrary.simpleMessage("Версия"),
        "accent": MessageLookupByLibrary.simpleMessage("Акцент"),
        "amberColor": MessageLookupByLibrary.simpleMessage("Янтарный"),
        "appLanguageSettingTitle":
            MessageLookupByLibrary.simpleMessage("Язык приложения"),
        "baseColors": MessageLookupByLibrary.simpleMessage("Базовые цвета"),
        "blueColor": MessageLookupByLibrary.simpleMessage("Синий"),
        "blueGreyColor": MessageLookupByLibrary.simpleMessage("Сине Серый"),
        "brownColor": MessageLookupByLibrary.simpleMessage("Коричневый"),
        "buildWord": MessageLookupByLibrary.simpleMessage("сборка"),
        "cantOpenUrlString": m0,
        "closeWord": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "columnCountSettingSubtitle": MessageLookupByLibrary.simpleMessage(
            "На текущий момент доступны значения только 2 и 3, используется для обоих сеток"),
        "columnCountSettingTitle":
            MessageLookupByLibrary.simpleMessage("Количество столбцов сетки"),
        "copiedToClipboardString":
            MessageLookupByLibrary.simpleMessage("скопирован в буфер обмена"),
        "currentLanguageString":
            MessageLookupByLibrary.simpleMessage("Текщий язык: "),
        "cyanColor": MessageLookupByLibrary.simpleMessage("Циановый"),
        "darkThemeSettingSubtitle": MessageLookupByLibrary.simpleMessage(
            "Переключение между темной и светлой темой оформления, по умолчанию используется темная"),
        "darkThemeSettingTitle":
            MessageLookupByLibrary.simpleMessage("Темная тема"),
        "deepOrangeColor":
            MessageLookupByLibrary.simpleMessage("Темно Оранжевый"),
        "deepPurpleColor":
            MessageLookupByLibrary.simpleMessage("Темно Фиолетовый"),
        "flutterFullVariantString":
            MessageLookupByLibrary.simpleMessage("Полный вариант во Flutter"),
        "flutterShortVariantString": MessageLookupByLibrary.simpleMessage(
            "Укороченный вариант во Flutter"),
        "githubRepoString":
            MessageLookupByLibrary.simpleMessage("Github-репозиторий"),
        "goToMainScreen":
            MessageLookupByLibrary.simpleMessage("На главный экран"),
        "greenColor": MessageLookupByLibrary.simpleMessage("Зелёный"),
        "greyColor": MessageLookupByLibrary.simpleMessage("Серый"),
        "hexValueOfColorString":
            MessageLookupByLibrary.simpleMessage("HEX код цвета"),
        "incorrectColorNameMessage": MessageLookupByLibrary.simpleMessage(
            "Некорректно указан цвет. Если вы видите это сообщение нажав на какой-либо цвет с главного экрана приложения, пожалуйста сообщите о проблеме в Github-репозиторий. Иначе же скорее всего проблема вызвана опечаткой в URL-адресе."),
        "incorrectColorNameString":
            MessageLookupByLibrary.simpleMessage("Некорректный цвет"),
        "indigoColor": MessageLookupByLibrary.simpleMessage("Индиго"),
        "lightBlueColor": MessageLookupByLibrary.simpleMessage("Голубой"),
        "lightGreenColor":
            MessageLookupByLibrary.simpleMessage("Светло Зеленый"),
        "limeColor": MessageLookupByLibrary.simpleMessage("Лаймовый"),
        "noNewUpdatesTitle":
            MessageLookupByLibrary.simpleMessage("Обновлений не найдено"),
        "notImplementedString":
            MessageLookupByLibrary.simpleMessage("ЕЩЕ НЕ РЕАЛИЗОВАНО"),
        "notLikeReleaseJsonString": MessageLookupByLibrary.simpleMessage(
            "Не выглядит как JSON-объект отдельного релиза!"),
        "ofAmberColor": MessageLookupByLibrary.simpleMessage("янтарного"),
        "ofBlueColor": MessageLookupByLibrary.simpleMessage("синего"),
        "ofBlueGreyColor": MessageLookupByLibrary.simpleMessage("сине серого"),
        "ofBrownColor": MessageLookupByLibrary.simpleMessage("коричневого"),
        "ofCyanColor": MessageLookupByLibrary.simpleMessage("цианового"),
        "ofDeepOrangeColor":
            MessageLookupByLibrary.simpleMessage("темно оранжевого"),
        "ofDeepPurpleColor":
            MessageLookupByLibrary.simpleMessage("темно фиолетового"),
        "ofGreenColor": MessageLookupByLibrary.simpleMessage("зелёного"),
        "ofGreyColor": MessageLookupByLibrary.simpleMessage("серого"),
        "ofIndigoColor": MessageLookupByLibrary.simpleMessage("индиго"),
        "ofLightBlueColor": MessageLookupByLibrary.simpleMessage("голубого"),
        "ofLightGreenColor":
            MessageLookupByLibrary.simpleMessage("светло зелёного"),
        "ofLimeColor": MessageLookupByLibrary.simpleMessage("лаймового"),
        "ofOrangeColor": MessageLookupByLibrary.simpleMessage("оранжевого"),
        "ofPinkColor": MessageLookupByLibrary.simpleMessage("розового"),
        "ofPurpleColor": MessageLookupByLibrary.simpleMessage("фиолетового"),
        "ofRedColor": MessageLookupByLibrary.simpleMessage("красного"),
        "ofTealColor": MessageLookupByLibrary.simpleMessage("бирюзового"),
        "ofYellowColor": MessageLookupByLibrary.simpleMessage("жёлтого"),
        "openWord": MessageLookupByLibrary.simpleMessage("Открыть"),
        "orangeColor": MessageLookupByLibrary.simpleMessage("Оранжевый"),
        "pinkColor": MessageLookupByLibrary.simpleMessage("Розовый"),
        "prereleaseWord": MessageLookupByLibrary.simpleMessage("Пред-Релиз"),
        "publishedAtDate": m1,
        "purpleColor": MessageLookupByLibrary.simpleMessage("Фиолетовый"),
        "redColor": MessageLookupByLibrary.simpleMessage("Красный"),
        "requiredFieldsNotFoundString": m2,
        "responseBody": m3,
        "responseStatus": m4,
        "rgbValueOfColorString":
            MessageLookupByLibrary.simpleMessage("RGB значение цвета"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "shade": MessageLookupByLibrary.simpleMessage("оттенок"),
        "shades": MessageLookupByLibrary.simpleMessage("Оттенки"),
        "switchViewTooltip": MessageLookupByLibrary.simpleMessage(
            "Переключить вид ( список / сетка )"),
        "systemWordAdjective":
            MessageLookupByLibrary.simpleMessage("Системный"),
        "tealColor": MessageLookupByLibrary.simpleMessage("Бирюзовый"),
        "unexpectedReponseString":
            MessageLookupByLibrary.simpleMessage("Неожиданный ответ!"),
        "updateErrorReceivedTitle": MessageLookupByLibrary.simpleMessage(
            "Ошибка при проверке обновлений"),
        "updateFoundTitle":
            MessageLookupByLibrary.simpleMessage("Найдено обновление"),
        "usingLatestVersion": MessageLookupByLibrary.simpleMessage(
            "Вы используете последнюю версию"),
        "yellowColor": MessageLookupByLibrary.simpleMessage("Жёлтый")
      };
}
