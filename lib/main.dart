import 'package:material_palette/data/cubits/progress_indicators/progress_indicators_cubit.dart';
import 'package:material_palette/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'package:material_palette/data/cubits/settings/settings_cubit.dart';
import 'package:material_palette/routes/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final ThemeData lightIndigo = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(
      primary: Colors.indigo,
      secondary: Colors.indigoAccent,
    )
  );
  final SharedPreferences prefs;

  MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (BuildContext context) => SettingsCubit(prefs),
        ),
        BlocProvider<ProgressIndicatorsCubit>(
          create: (BuildContext context) => ProgressIndicatorsCubit(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Material Palette' ,
            debugShowCheckedModeBanner: false,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            theme: state.darkTheme ? ThemeData.dark() : lightIndigo,
            localizationsDelegates: AppLocale.localizationsDelegates,
            supportedLocales: AppLocale.supportedLocales,
            locale: state.languageChanged ? state.locale : null
          );
        },
      ),
    );
  }
}
