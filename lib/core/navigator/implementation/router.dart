
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progresswebtu/core/home/implementation/view.dart';
import 'package:progresswebtu/core/splash/feature.dart';
import 'routes.dart';

abstract class AppRouter {

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return getPageRoute(
          settings: settings,
          view: const HomeView(),
        );
     
        
      default:
        return getPageRoute(
          settings: settings,
          view:  SplashView(settings:settings),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}


