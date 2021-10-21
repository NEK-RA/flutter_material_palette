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
        title: Text('Shades of ${ColorPalette.getReadableColorName(color: colorName)}'),
        centerTitle: true,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.shadesListView ? _buildListView() : _buildGridView(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Switch view ( list / grid )',
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
              isVertical: vertical,
              pressable: true,
          ),
      for (int shade in ColorPalette.shades)
        ColorCard(
            name: colorName,
            shade: shade,
            withHex: true,
            isVertical: vertical,
            pressable: true,
        )
    ];
  }

  Widget _buildListView() {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: colorCardList(),
    );
  }

  Widget _buildGridView(BuildContext context) {
    int itemCount = context.read<SettingsCubit>().state.columnsInGrid;
    double ratio = itemCount == 2 ? 1.5 : 1.0;
    return GridView.count(
      crossAxisCount: itemCount,
      childAspectRatio: ratio,
        padding: const EdgeInsets.all(8.0),
        children: colorCardList(vertical: true));
  }
}
