import 'package:auto_route/auto_route.dart';
import 'package:material_palette/data/constants.dart';
import 'package:material_palette/data/cubits/settings/settings_cubit.dart';
import 'package:material_palette/data/repositories/updates_repository.dart';
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
    return AppLocale.getLanguageName(current);
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
              child: Text(AppLocale.getLanguageName(locale.toString())),
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
          onTap: () => openUrl(Constants.homepageUrl),
        ),
        const Divider(),
        ListTile(
          title: Text('${S.of(context).aboutAppVersionTitle} — ${Constants.appVersion} ${S.of(context).buildWord} ${Constants.appBuild}'),
          subtitle: Text(S.of(context).aboutAppVersionSubtitle),
          leading: const Icon(Icons.info),
          onTap: ()=> checkUpdates(context: context,snackbar: false),
        )

      ],
    );
  }

  void openUrl(String url) async {
    await canLaunch(Constants.homepageUrl) ?
      await launch(Constants.homepageUrl) :
      throw 'Could not launch ${Constants.homepageUrl}';
  }

  void checkUpdates({bool snackbar=true, required BuildContext context}) async {
    if(snackbar){
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
    }else{
      Update info = await UpdatesRepository.checkUpdates(context);
      if(info is UpdateNotNeeded){
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text(S.of(context).noNewUpdatesTitle),
              content: Text(S.of(context).usingLatestVersion),
              actions: [
                ElevatedButton(
                  onPressed: () => context.router.pop(),
                  child: const Text('OK')
                )
              ],
            );
          }
        );
      }else if(info is UpdateError){
        showDialog(
          context: context,
          builder: (context){
            return SimpleDialog(
              title: Text(S.of(context).updateErrorReceivedTitle),
              children: [
                ListTile(
                  title: Text(info.message),
                  dense: true
                ),
                ListTile(
                  title: Text(S.of(context).responseStatus(info.status)),
                  dense: true
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: 300,
                    height: 220,
                    child: ListView(
                      children: [
                        Text(S.of(context).responseBody(info.body))
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () => context.router.pop(),
                    child: const Text('OK')
                  ),
                )
              ],
            );
          }
        );
      }else if(info is GithubUpdate){
        showDialog(
          context: context,
          builder: (context){
            return SimpleDialog(
              title: Text('${S.of(context).updateFoundTitle} ${info.isPreRelease ? ' (${S.of(context).prereleaseWord})' : ''}'),
              children: [
                ListTile(
                  title: Text('${S.of(context).aboutAppVersionTitle}: ${info.version}'),
                  dense: true
                ),
                ListTile(
                  title: Text(S.of(context).publishedAtDate(info.published)),
                  dense: true
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: 300,
                    height: 220,
                    child: ListView(
                      children: [
                        Text(info.description)
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                    onPressed: () => context.router.pop(),
                    child: Text(S.of(context).closeWord)
                  )
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () => openUrl(info.url),
                    child: Text(S.of(context).openWord)
                  )
                )
              ],
            );
          }
        );
      }
    }
  }
}