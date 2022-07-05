import 'package:flutter/material.dart';
import 'package:animaldex/core/fade_page_route.dart';
import 'package:animaldex/ui/screens/home/home.dart';
import 'package:animaldex/ui/screens/animaldex/animaldex.dart';
import 'package:animaldex/ui/screens/animal_info/animal_info.dart';
import 'package:animaldex/ui/screens/splash/splash.dart';

enum Routes { splash, home, animaldex, animalInfo, typeEffects, items }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String animaldex = '/home/animaldex';
  static const String animalInfo = '/home/animal';
  static const String typeEffectsScreen = '/home/type';
  static const String itemsList = '/home/items';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.animaldex: _Paths.animaldex,
    Routes.animalInfo: _Paths.animalInfo,
    Routes.typeEffects: _Paths.typeEffectsScreen,
    Routes.items: _Paths.itemsList
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: SplashScreen());

      case _Paths.animaldex:
        return FadeRoute(page: AnimaldexScreen());

      case _Paths.animalInfo:
        return FadeRoute(page: AnimalInfo());

      case _Paths.home:
      default:
        return FadeRoute(page: HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
