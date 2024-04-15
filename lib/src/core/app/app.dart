import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monify/src/core/app/router/router.dart';
import 'package:monify/src/core/app/theme/app_theme.dart';



class App extends StatelessWidget {
  App({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _appRouter.routeInfoProvider(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(
            _appRouter,
            navigatorObservers: () => [AppRouteObserver()]
        ),
        onGenerateTitle: (context) => "Monify",
        theme: AppTheme().themeData,
        // routes: _appRouter.routes,
      ),
    );
  }
}
