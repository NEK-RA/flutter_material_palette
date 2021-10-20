// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../ui/color_shade_page.dart' as _i2;
import '../ui/palette_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    PaletteRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PalettePage());
    },
    ColorShadesRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ColorShadesRouteArgs>(
          orElse: () => ColorShadesRouteArgs(
              colorName: pathParams.getString('colorName')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ColorShadesPage(key: args.key, colorName: args.colorName));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(PaletteRoute.name, path: '/'),
        _i3.RouteConfig(ColorShadesRoute.name, path: '/color/:colorName')
      ];
}

/// generated route for [_i1.PalettePage]
class PaletteRoute extends _i3.PageRouteInfo<void> {
  const PaletteRoute() : super(name, path: '/');

  static const String name = 'PaletteRoute';
}

/// generated route for [_i2.ColorShadesPage]
class ColorShadesRoute extends _i3.PageRouteInfo<ColorShadesRouteArgs> {
  ColorShadesRoute({_i4.Key? key, required String colorName})
      : super(name,
            path: '/color/:colorName',
            args: ColorShadesRouteArgs(key: key, colorName: colorName),
            rawPathParams: {'colorName': colorName});

  static const String name = 'ColorShadesRoute';
}

class ColorShadesRouteArgs {
  const ColorShadesRouteArgs({this.key, required this.colorName});

  final _i4.Key? key;

  final String colorName;
}
