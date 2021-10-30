import 'package:auto_route/auto_route.dart';
import 'package:material_palette/data/constants.dart';
import 'package:material_palette/data/cubits/settings/settings_cubit.dart';
import 'package:material_palette/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings + ' | ' + S.of(context).about),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(S.of(context).settings),
          ),
          Card(child: settings(context)),
          ListTile(
            title: Text(S.of(context).about),
          ),
          Card(child: about(context))
        ],
      )
    );
  }

  String getCurrentLanguageName(BuildContext context){
    String current = Localizations.localeOf(context).toString();
    if(Constants.languageNames.containsKey(current)){
      return Constants.languageNames[current]!;
    }else{
      return S.of(context).systemWordAdjective;
    }
  }

  Widget settings(BuildContext context){
    return BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context,state){
          String currentLanguage = state.languageChanged ? getCurrentLanguageName(context) : '${S.of(context).systemWordAdjective} (${getCurrentLanguageName(context)})';
          return Column(
            children: [
              
              ListTile(
                title: Text(S.of(context).appLanguageSettingTitle),
                subtitle: Text(S.of(context).currentLanguageString + currentLanguage),
                onTap: () => showLanguagesDialog(context),
              ),

              SwitchListTile(
                title:Text(
                  S.of(context).listOnColorsScreenSettingTitle
                ),
                subtitle: state.colorsListView
                  ? Text(S.of(context).listOnColorsScreenSettingSubtitleForEnabled)
                  : Text(S.of(context).listOnColorsScreenSettingSubtitleForDisabled) ,
                value: state.colorsListView,
                onChanged: (bool _) => context.read<SettingsCubit>().switchColorsView(),
              ),

              const Divider(),

              SwitchListTile(
                title: Text(S.of(context).listOnShadesScreenSettingTitle),
                subtitle: state.shadesListView
                  ? Text(S.of(context).listOnShadesScreenSettingSubtitleForEnabled)
                  : Text(S.of(context).listOnShadesScreenSettingSubtitleForDisabled) ,
                value: state.shadesListView,
                onChanged: (bool _) => context.read<SettingsCubit>().switchShadesView(),
              ),
              
              const Divider(),
              
              SwitchListTile(
                title: Text(S.of(context).darkThemeSettingTitle),
                subtitle: Text(S.of(context).darkThemeSettingSubtitle),
                value: state.darkTheme,
                onChanged: (bool _) => context.read<SettingsCubit>().switchTheme(),
              ),
              
              const Divider(),
              
              ListTile(
                title: Text(S.of(context).columnCountSettingTitle),
                subtitle: Text(S.of(context).columnCountSettingSubtitle),
              ),
              Slider(
                max: 3,
                min: 2,
                divisions: 1,
                value: state.columnsInGrid.toDouble(),
                label: state.columnsInGrid.toString(), 
                onChanged: (double newValue){
                  context.read<SettingsCubit>().setColumnsCount(newValue.toInt());
                }
              )
            ],
          );
        }
      );
  }

  void showLanguagesDialog(BuildContext context) async {
    String? selectedLocale = await showDialog<String>(
      context: context,
      builder:(context){
      return SimpleDialog(
        title: Text(S.of(context).appLanguageSettingTitle),
        children: [
          SimpleDialogOption(
            child: Text(S.of(context).systemWordAdjective),
            onPressed: () => context.router.pop('system'),
          ),
          for (var locale in AppLocale.supportedLocales)
            SimpleDialogOption(
              child: Text(Constants.languageNames[locale.toString()]!),
              onPressed: () => context.router.pop(locale.toString()),
            ),
        ],
      );
    });

    if(selectedLocale!=null){
      if(selectedLocale == 'system'){
        context.read<SettingsCubit>().useSystemLanguage();
      }else{
        context.read<SettingsCubit>().changeLanguage(selectedLocale);
      }
    }
  }

  Widget about(BuildContext context){
    return Column(
      children: [
        ListTile(
          title: Text(S.of(context).aboutAppHomepage),
          subtitle: const Text(Constants.homepageUrl),
          leading: const Icon(Icons.home),
          onTap: launchHomepage,
        ),
        const Divider(),
        ListTile(
          title: Text('${S.of(context).aboutAppVersionTitle} — ${Constants.appVersion} ${S.of(context).buildWord} ${Constants.appBuild}'),
          subtitle: Text(S.of(context).aboutAppVersionSubtitle),
          leading: const Icon(Icons.info),
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Spacer(),
                    Text(S.of(context).notImplementedString),
                    const Spacer()
                  ]
                ),
                duration: const Duration(seconds: 3),
              )
            );
          },
        )

      ],
    );
  }

  void launchHomepage() async {
    await canLaunch(Constants.homepageUrl) ?
      await launch(Constants.homepageUrl) :
      throw 'Could not launch ${Constants.homepageUrl}';
  }
}