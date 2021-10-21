import 'package:color_palette/data/cubits/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:color_palette/routes/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return BlocProvider(
      create: (context) => SettingsCubit(prefs),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            theme: state.darkTheme ? ThemeData.dark() : lightIndigo,
          );
        },
      ),
    );
  }
}
