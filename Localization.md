# Localization guide

## Only translation

1. Go to `lib/l10n`
2. Create new file called `intl_<language code>_<country code>.arb`, examples are `intl_en_US.arb` for "English US" or `intl_ru_RU.arb` for "Russian" languages.
3. Insert template and paste `<language code>_<country code>` value for `@@locale`:

    ```arb
    {
        "@@locale": "",
    }
    ```

4. All strings that should be translated are defined as key-value: `"keyOfSomeString": "Some string"`
    If you open `intl_en_US.arb`, you'll found:

    ```arb
    {
        "@@locale": "en_US",

        "baseColors": "Base colors",
        "@baseColors": {
          "description": "Title for the app bar on palette_page.dart"
        },

        "shades": "Shades",
        "@shades": {
          "description": "Part of title for the app bar on color_shade_page.dart, another part is in the end of localization file for all the colors in form 'ofNameColor'"
        },
        ... // other strings
    }
    ```

    4.1 The required for translation part (from the example above) are localized values - `"Base colors"` and `"Shades"`.
    The `baseColors` and `shades` here are keys for usage in app. They should not be translated.

    4.2 There are also entries, which keys started with `@`. They are optional and used to provide some description (usage context or anything else) to entries without `@`. So `@baseColors` contains description for entry with key `baseColors` and so on. It's not necessary to translate them, but you can do it if you wish.

    4.3 ARB files uses the JSON syntax, so don't forget to separate entries with commas

5. **WARNING:** you don't need to work with files in `lib/generated/intl` because they are generated from `intl_*_*.arb` files!

6. Add your language name into supported list:

    6.0 Open the `lib/locale.dart` and find the `supportedLocales` list:

    ```dart
    static const supportedLocales = [
        Locale('en', 'US')
    ];
    ```

    6.1 Add the comma after last entry and add to this list the `Locale('your language code','your country code')`, in case of russian it's a `Locale('ru', 'RU')`, so finally it looks like:

    ```dart
    static const supportedLocales = [
        Locale('en', 'US'),
        Locale('ru', 'RU')
    ];
    ```

    6.2 Scroll down and find a `_languageNames` map:

    ```dart
      static const Map<String,String> _languageNames = {
        'en_US':'English (US)'
      };
    ```

    It's a map, where each `<language code>_<country code>` mapped to it's native language name

    6.3 Add comma after last entry of this map and add new entry related to your translation, i.e. for russian this entry will look `'ru_RU':'Русский'` and finally this map should look like

    ```dart
    static const Map<String,String> _languageNames = {
      'en_US':'English (US)',
      'ru_RU':'Русский'
    };
    ```

    This step is not required, but these language names are displayed in app settings. Without language name added to this place, app will show just `<language code>_<country code>`, i.e. just `ru_RU` instead of `Русский`.

7. Create a pull request with translations.

## Translate and check how it works before creating pull request

1. Repeat translation steps 1-6 from guide above

2. Decide if you want to check if translated content looks good by building app locally or using automatic builds. For local building follow steps 3-9, for using automated builds follow steps 10-19

    2.1 WARNING: for automated builds you still need Flutter SDK to generate necessary files from `intl_*_*.arb` files, but you don't need to prepare build environment itself (installing Android Studio/Visual Studio toolchains, installing required libraries for Linux and etc.)

3. Download Flutter SDK from [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

4. Choose device where you would like to test app and setup environment:

    4.1 Windows (used Win32, not UWP) - [https://flutter.dev/docs/get-started/install/windows#windows-setup](https://flutter.dev/docs/get-started/install/windows#windows-setup).

    4.2 Linux - [https://flutter.dev/docs/get-started/install/linux#linux-setup](https://flutter.dev/docs/get-started/install/linux#linux-setup)

    4.3 Android - [for building on Windows](https://flutter.dev/docs/get-started/install/windows#android-setup), [for building on Linux](https://flutter.dev/docs/get-started/install/linux#android-setup)

    4.4 Web browser - [https://flutter.dev/docs/get-started/web](https://flutter.dev/docs/get-started/web). P.S.: in case of Windows - Edge may be used instead of Chrome.

5. Optional - Disable Google Analytics by running `flutter config --no-analytics`

6. Install project dependencies by running `flutter pub get`

7. Run next command in repository - `flutter pub run intl_utils:generate`. It will generate all necessary files from existing `intl_*_*.arb` files.

8. Check if selected device found by running `flutter devices`

    8.1 Android emulators need to be launched to be listed here.

    8.2 Example output is:

    ```sh
    3 connected devices:

    Android SDK built for x86 64 (mobile) • emulator-5554 • android-x64    • Android 10 (API 29) (emulator)
    Windows (desktop)                     • windows       • windows-x64    • Microsoft Windows [Version 10.0.19043.1237]
    Edge (web)                            • edge          • web-javascript • Microsoft Edge 95.0.1020.40
    ```

    8.3 Note the "device id", which is shown after first • symbol. So for shown example output Windows "device id" is `windows`, MS Edge's id is `edge` and Android Emulator's id is `emulator-5554`

9. Run project on selected device by running `flutter run -d your-selected-device-id`. Flutter will build debug version of project and launch it on specified device.

10. If you want to use automated builds then go to your fork of project

11. Open repository settings

12. Go to "Actions" and enable Github Actions for your repository

13. You already have 3 config for automated builds at `.github/workflows` - there is config to make debug build for windows, linux and android

14. Commit and push your translations to your fork (including the generated files from `lib/generated`) - this will trigger automated builds for all provided build configs

15. Visit in browser your repo url and find there "Actions" tab

    ![actions tab](https://i.imgur.com/wGxqHNy.png)

16. You'll see all workflow runs (builds)

    ![automated builds](https://i.imgur.com/evttD14.png)

17. Wait until build finished - there will appear green checkmark icon on the left if build was successfull

18. Open workflow run's info - in case of successfull build you'll see the "Artifacts" section below
    ![artifacts section](https://i.imgur.com/JVl1ldu.png)

19. Download the artifact (which is zip archive exactly with build output), unzip it and run on device.

    19.1 Notice that Artifacts available to users which are logged into their Github accounts. Guest won't be able to download artifacts as well as they won't see the build logs

    19.2 All built artifacts are debug versions, so they expected to be larger than release builds
