// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:tsl_flutter_template/presentation/screen/dashboard/dashboard_screen.dart'
    as _i1;
import 'package:tsl_flutter_template/presentation/screen/home/home_screen.dart'
    as _i2;
import 'package:tsl_flutter_template/presentation/screen/splash/splash_screen.dart'
    as _i3;
import 'package:tsl_flutter_template/presentation/screen/widget_screen/widget_screen.dart'
    as _i5;
import 'package:tsl_flutter_template/presentation/widgets/others/widgets.dart'
    as _i4;

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}

/// generated route for
/// [_i4.WebViewScreen]
class WebViewRoute extends _i6.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    required String url,
    required String appbarTitle,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         WebViewRoute.name,
         args: WebViewRouteArgs(url: url, appbarTitle: appbarTitle, key: key),
         initialChildren: children,
       );

  static const String name = 'WebViewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebViewRouteArgs>();
      return _i4.WebViewScreen(
        url: args.url,
        appbarTitle: args.appbarTitle,
        key: args.key,
      );
    },
  );
}

class WebViewRouteArgs {
  const WebViewRouteArgs({
    required this.url,
    required this.appbarTitle,
    this.key,
  });

  final String url;

  final String appbarTitle;

  final _i7.Key? key;

  @override
  String toString() {
    return 'WebViewRouteArgs{url: $url, appbarTitle: $appbarTitle, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebViewRouteArgs) return false;
    return url == other.url &&
        appbarTitle == other.appbarTitle &&
        key == other.key;
  }

  @override
  int get hashCode => url.hashCode ^ appbarTitle.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i5.WidgetsScreen]
class WidgetsRoute extends _i6.PageRouteInfo<void> {
  const WidgetsRoute({List<_i6.PageRouteInfo>? children})
    : super(WidgetsRoute.name, initialChildren: children);

  static const String name = 'WidgetsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.WidgetsScreen();
    },
  );
}
