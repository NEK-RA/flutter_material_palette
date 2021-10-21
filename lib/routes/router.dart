import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:color_palette/ui/color_shade_page.dart';
import 'package:color_palette/ui/palette_page.dart';
import 'package:color_palette/ui/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: PalettePage,
      initial: true
    ),
    AutoRoute(
      path: '/color/:colorName',
      page: ColorShadesPage
    ),
    AutoRoute(
      path: '/settings',
      page: SettingsPage
    )
  ]
)
class $AppRouter {}