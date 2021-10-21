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
            onPressed: () => context.router.pushNamed('/settings'),
            icon: const Icon(Icons.settings)
          )
        ],
      ),
      body: BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context, state){
          return state.colorsListView ? _buildListView(context) : _buildGridView(context);
        }
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Switch view ( list / grid )',
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

  List<Widget> colorCardList(BuildContext context,bool vertical){
    return <Widget>[
      for (String color in ColorPalette.colors.keys)
        GestureDetector(
          child: ColorCard(name: color,isVertical: vertical),
          onTap: (){
            AutoRouter.of(context).pushNamed('/color/$color');
          }
        )
    ];
  }

  Widget _buildListView(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: colorCardList(context,false)
    );
  }

  Widget _buildGridView(BuildContext context) {
    int itemCount = context.read<SettingsCubit>().state.columnsInGrid;
    double ratio = itemCount == 2 ? 2.0 : 1.3;
    return GridView.count(
      crossAxisCount: itemCount,
      childAspectRatio: ratio,
      padding: const EdgeInsets.all(8.0),
      children: colorCardList(context,true)
    );
  }
}

  

