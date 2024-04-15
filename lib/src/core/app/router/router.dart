


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monify/src/core/app/router/router.gr.dart';


class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint("Going to : ${route.settings.name}");
  }
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: "/home", ),
    AutoRoute(page: AuthRoute.page, path: "/auth", initial: true)
  ];
}
