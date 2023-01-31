
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progresswebtu/core/home/implementation/view.dart';
import 'package:progresswebtu/core/login/feature.dart';
import 'package:progresswebtu/core/settings/feature.dart';
import 'package:progresswebtu/core/splash/feature.dart';
import 'package:progresswebtu/core/splash/implementation/not_done_view.dart';
import 'package:progresswebtu/features/bac/feature.dart';
import 'package:progresswebtu/features/examsResult/implementation/view.dart';
import 'package:progresswebtu/features/groupsAndSections/implementation/view.dart';
import 'package:progresswebtu/features/studentCard/feature.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return getPageRoute(
          settings: settings,
          view: const HomeView(),
        );

      case loginRoute:
        return getPageRoute(
          settings: settings,
          view: LoginView(),
        );

      case settingsRoute:
        return getPageRoute(
          settings: settings,
          view: SettingsView(
            controller: SettingsController.instance,
          ),
        );

      case bacRoute:
        return getPageRoute(
          settings: settings,
          view: const BacInformationsView(),
        );

      case loadingRoute:
        return getPageRoute(
          settings: settings,
          view: SplashView(settings: settings),
        );

        case examResultsRoute:
        return getPageRoute(
          settings: settings,
          view: const ExamsResultView(),
        );

        case groupeAndSectionsRoute:
        return getPageRoute(
          settings: settings,
          view: const GroupsAndSectionsView(),
        );

        case studentCardRoute:
        return getPageRoute(
          settings: settings,
          view: const StudentCardView(),
        );

      default:
        return getPageRoute(
          settings: settings,
          view: const NotAvaillableView(),
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
