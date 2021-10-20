import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:color_palette/data/cubits/settings/settings_cubit.dart';
import 'package:color_palette/data/repositories/colors_repository.dart';
import 'package:color_palette/widgets/color_card.dart';


class PalettePage extends StatelessWidget {
  const PalettePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base colors'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.read<SettingsCubit>().switchTheme(),
            icon: BlocBuilder<SettingsCubit,SettingsState>(
              builder: (context, state){
                return Icon(state.darkTheme ? Icons.wb_sunny : Icons.nightlight);
              },
            )
          )
        ],
      ),
      body: BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context, state){
          return state.colorsListView ? _buildListView(context) : _buildGridView(context);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: BlocBuilder<SettingsCubit,SettingsState>(
          builder: (context, state){
            return Icon(
              state.colorsListView? Icons.grid_view_sharp : Icons.list
            );
          },
        ),
        onPressed: (){
          context.read<SettingsCubit>().switchColorsView();
        },
      ),
    );
  }

  List<Widget> colorCardList(BuildContext context){
    return <Widget>[
      for (String color in ColorPalette.colors.keys)
        GestureDetector(
          child: ColorCard(name: color),
          onTap: (){
            AutoRouter.of(context).pushNamed('/color/$color');
          }
        )
    ];
  }

  Widget _buildListView(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: colorCardList(context)
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2.0,
      padding: const EdgeInsets.all(8.0),
      children: colorCardList(context)
    );
  }
}

  

