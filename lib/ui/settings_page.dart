import 'package:color_palette/data/cubits/settings/settings_cubit.dart';
import 'package:color_palette/l10n/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Widget settings(BuildContext context){
    return BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context,state){
          return Column(
            children: [

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

  Widget about(BuildContext context){
    return Column(
      children: [
        ListTile(
          title: Text(lc(context).aboutAppHomepage),
          subtitle: const Text('https://github.com/NEK-RA/flutter_color_palette'),
          leading: const Icon(Icons.home),
        ),
        const Divider(),
        ListTile(
          title: Text('${lc(context).aboutAppVersionTitle} — 1.0.0+1'),
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

}