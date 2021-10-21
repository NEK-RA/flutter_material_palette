// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../ui/color_shade_page.dart' as _i2;
import '../ui/palette_page.dart' as _i1;
import '../ui/settings_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PaletteRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PalettePage());
    },
    ColorShadesRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ColorShadesRouteArgs>(
          orElse: () => ColorShadesRouteArgs(
              colorName: pathParams.getString('colorName')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ColorShadesPage(key: args.key, colorName: args.colorName));
    },
    SettingsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SettingsPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(PaletteRoute.name, path: '/'),
        _i4.RouteConfig(ColorShadesRoute.name, path: '/color/:colorName'),
        _i4.RouteConfig(SettingsRoute.name, path: '/settings')
      ];
}

/// generated route for [_i1.PalettePage]
class PaletteRoute extends _i4.PageRouteInfo<void> {
  const PaletteRoute() : super(name, path: '/');

  static const String name = 'PaletteRoute';
}

/// generated route for [_i2.ColorShadesPage]
class ColorShadesRoute extends _i4.PageRouteInfo<ColorShadesRouteArgs> {
  ColorShadesRoute({_i5.Key? key, required String colorName})
      : super(name,
            path: '/color/:colorName',
            args: ColorShadesRouteArgs(key: key, colorName: colorName),
            rawPathParams: {'colorName': colorName});

  static const String name = 'ColorShadesRoute';
}

class ColorShadesRouteArgs {
  const ColorShadesRouteArgs({this.key, required this.colorName});

  final _i5.Key? key;

  final String colorName;
}

/// generated route for [_i3.SettingsPage]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '/settings');

  static const String name = 'SettingsRoute';
}
