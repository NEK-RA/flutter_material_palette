import 'package:auto_route/auto_route.dart';
import 'package:material_palette/data/constants.dart';
import 'package:material_palette/data/cubits/settings/settings_cubit.dart';
import 'package:material_palette/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lc(context).settings + ' | ' + lc(context).about),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(lc(context).settings),
          ),
          Card(child: settings(context)),
          ListTile(
            title: Text(lc(context).about),
          ),
          Card(child: about(context))
        ],
      )
    );
  }

  AppLocalizations lc(BuildContext context) => AppLocalizations.of(context)!; 

  final Map<String,String> languageNames = const {
    'ru':'Русский',
    'en':'English'
  };

  String getCurrentLanguageName(BuildContext context){
    String languageCode = Localizations.localeOf(context).languageCode;
    if(languageNames.containsKey(languageCode)){
      return languageNames[languageCode]!;
    }else{
      return lc(context).systemWordAdjective;
    }
  }

  Widget settings(BuildContext context){
    return BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context,state){
          String currentLanguage = state.languageChanged ? getCurrentLanguageName(context) : '${lc(context).systemWordAdjective} (${getCurrentLanguageName(context)})';
          return Column(
            children: [
              
              ListTile(
                title: Text(lc(context).appLanguageSettingTitle),
                subtitle: Text(lc(context).currentLanguageString + currentLanguage),
                onTap: () => showLanguagesDialog(context),
              ),

              SwitchListTile(
                title:Text(
                  lc(context).listOnColorsScreenSettingTitle
                ),
                subtitle: state.colorsListView
                  ? Text(lc(context).listOnColorsScreenSettingSubtitleForEnabled)
                  : Text(lc(context).listOnColorsScreenSettingSubtitleForDisabled) ,
                value: state.colorsListView,
                onChanged: (bool _) => context.read<SettingsCubit>().switchColorsView(),
              ),

              const Divider(),

              SwitchListTile(
                title: Text(lc(context).listOnShadesScreenSettingTitle),
                subtitle: state.shadesListView
                  ? Text(lc(context).listOnShadesScreenSettingSubtitleForEnabled)
                  : Text(lc(context).listOnShadesScreenSettingSubtitleForDisabled) ,
                value: state.shadesListView,
                onChanged: (bool _) => context.read<SettingsCubit>().switchShadesView(),
              ),
              
              const Divider(),
              
              SwitchListTile(
                title: Text(lc(context).darkThemeSettingTitle),
                subtitle: Text(lc(context).darkThemeSettingSubtitle),
                value: state.darkTheme,
                onChanged: (bool _) => context.read<SettingsCubit>().switchTheme(),
              ),
              
              const Divider(),
              
              ListTile(
                title: Text(lc(context).columnCountSettingTitle),
                subtitle: Text(lc(context).columnCountSettingSubtitle),
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
    String? selectedCode = await showDialog<String>(
      context: context,
      builder:(context){
      return SimpleDialog(
        title: Text(lc(context).appLanguageSettingTitle),
        children: [
          SimpleDialogOption(
            child: Text(lc(context).systemWordAdjective),
            onPressed: () => context.router.pop('system'),
          ),
          for (var locale in AppLocalizations.supportedLocales)
            SimpleDialogOption(
              child: Text(languageNames[locale.languageCode]!),
              onPressed: () => context.router.pop(locale.languageCode),
            ),
        ],
      );
    });

    if(selectedCode!=null){
      if(selectedCode == 'system'){
        context.read<SettingsCubit>().useSystemLanguage();
      }else{
        context.read<SettingsCubit>().changeLanguage(selectedCode);
      }
    }
  }

  Widget about(BuildContext context){
    return Column(
      children: [
        ListTile(
          title: Text(lc(context).aboutAppHomepage),
          subtitle: const Text(Constants.homepageUrl),
          leading: const Icon(Icons.home),
          onTap: launchHomepage,
        ),
        const Divider(),
        ListTile(
          title: Text('${lc(context).aboutAppVersionTitle} — ${Constants.appVersion} ${lc(context).buildWord} ${Constants.appBuild}'),
          subtitle: Text(lc(context).aboutAppVersionSubtitle),
          leading: const Icon(Icons.info),
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Spacer(),
                    Text(lc(context).notImplementedString),
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