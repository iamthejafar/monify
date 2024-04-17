// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:monify/src/comman/error/no_internet.dart' as _i4;
import 'package:monify/src/features/auth/presentation/screens/auth_screen.dart'
    as _i2;
import 'package:monify/src/features/home/presentation/screens/add_transaction_screen.dart'
    as _i1;
import 'package:monify/src/features/home/presentation/screens/home_screen.dart'
    as _i3;
import 'package:monify/src/features/splash/splash_screen.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AddTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<AddTransactionRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddTransactionScreen(
          key: args.key,
          isExpense: args.isExpense,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    NoInternetRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NoInternetScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTransactionScreen]
class AddTransactionRoute extends _i6.PageRouteInfo<AddTransactionRouteArgs> {
  AddTransactionRoute({
    _i7.Key? key,
    required bool isExpense,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AddTransactionRoute.name,
          args: AddTransactionRouteArgs(
            key: key,
            isExpense: isExpense,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTransactionRoute';

  static const _i6.PageInfo<AddTransactionRouteArgs> page =
      _i6.PageInfo<AddTransactionRouteArgs>(name);
}

class AddTransactionRouteArgs {
  const AddTransactionRouteArgs({
    this.key,
    required this.isExpense,
  });

  final _i7.Key? key;

  final bool isExpense;

  @override
  String toString() {
    return 'AddTransactionRouteArgs{key: $key, isExpense: $isExpense}';
  }
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NoInternetScreen]
class NoInternetRoute extends _i6.PageRouteInfo<void> {
  const NoInternetRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NoInternetRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
