import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Provider,Route',
)
@AutoRouterConfig(replaceInRouteName: 'Provider,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: Routes.splash, initial: true),
      ];
}

class Routes {
  static const String splash = '/';
  static const String login = '/login';
}
