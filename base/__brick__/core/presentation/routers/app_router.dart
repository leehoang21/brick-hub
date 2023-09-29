import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../features/splash/splash_screen.dart';
import '../../../features/empty/empty_page.dart';

part 'app_router.gr.dart';
//flutter pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig(replaceInRouteName: 'Provider,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashPageRoute.page,
          path: Routes.splash,
          initial: true,
        ),
         AutoRoute(page: EmptyRoute.page),
    
      ];
}

class Routes {
  static const String splash = '/';

}
