// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:tr_store/core/app_components/app_routes.dart';
import 'package:tr_store/navigation_window.dart';

class CustomRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var arg = settings.arguments == null ? {} : settings.arguments as Map;
    switch (settings.name) {
      case AppRoutes.navigationWindow:
        return routeBuilder(NavigationWindow());
      default:
        return null;
    }
  }

  static PageRouteBuilder routeBuilder(Widget screen,
      {double? dx, double? dy, int? time}) {
    return PageRouteBuilder(
        opaque: true,
        transitionDuration: Duration(milliseconds: time ?? 100),
        pageBuilder: (BuildContext context, _, __) {
          return screen;
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(dx ?? 1, dy ?? 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
  }
}
