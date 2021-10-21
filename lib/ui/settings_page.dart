import 'package:color_palette/data/cubits/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings and About'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(child: settings()),
          Card(child: about())
        ],
      )
    );
  }

  Widget settings(){
    return BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context,state){
          return Column(
            children: [
              SwitchListTile(
                title: const Text('List on colors screen'),
                subtitle: state.colorsListView ? const Text('Colors are shown in list.'):const Text('Colors are shown in grid with 2 or 3 columns.') ,
                value: state.colorsListView,
                onChanged: (bool _) => context.read<SettingsCubit>().switchColorsView(),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('List on shades screen'),
                subtitle: state.shadesListView ? const Text('Shades are shown in list.'):const Text('Shades are shown in grid with 2 or 3 columns.') ,
                value: state.shadesListView,
                onChanged: (bool _) => context.read<SettingsCubit>().switchShadesView(),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Dark theme'),
                subtitle: const Text('Switch between dark and light themes. The default theme is dark.'),
                value: state.darkTheme,
                onChanged: (bool _) => context.read<SettingsCubit>().switchTheme(),
              ),
              const Divider(),
              const ListTile(
                title: Text('Column count'),
                subtitle: Text('Currently between 2 and 3 only. Used for both colors and shades grid.'),
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

  Widget about(){
    return Column(
      children: [
        ListTile(
          title: const Text('App home'),
          subtitle: const Text('https://github.com/NEK-RA/flutter_color_palette'),
          leading: const Icon(Icons.home),
          onTap: (){

          }
        ),
        const Divider(),
        ListTile(
          title: const Text('Version — 1.0.0+1'),
          subtitle: const Text('Tap here to check for updates 😁\n(NOT IMPLEMENTED YET)'),
          leading: const Icon(Icons.info),
          onTap: (){

          },
        )

      ],
    );
  }

}