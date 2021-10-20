import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:color_palette/data/cubits/settings/settings_cubit.dart';
import 'package:color_palette/data/repositories/colors_repository.dart';
import 'package:color_palette/widgets/color_card.dart';

class ColorShadesPage extends StatelessWidget {
  final String colorName;

  const ColorShadesPage(
      {Key? key, @PathParam('colorName') required this.colorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shades of $colorName'),
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
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.shadesListView ? _buildListView() : _buildGridView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Icon(state.shadesListView ? Icons.grid_view_sharp : Icons.list);
          },
        ),
        onPressed: () {
          context.read<SettingsCubit>().switchShadesView();
        },
      ),
    );
  }

  List<Widget> colorCardList({bool vertical = false}) {
    return <Widget>[
      if (ColorPalette.hasAccentColor(colorName))
        for (int shade in ColorPalette.accentShades)
          ColorCard(
              name: colorName,
              shade: shade,
              withHex: true,
              isAccent: true,
              isVertical: vertical),
      for (int shade in ColorPalette.shades)
        ColorCard(
            name: colorName, shade: shade, withHex: true, isVertical: vertical)
    ];
  }

  Widget _buildListView() {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: colorCardList(),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        padding: const EdgeInsets.all(8.0),
        children: colorCardList(vertical: true));
  }
}
