import 'package:flutter/material.dart';
import 'package:progresswebtu/core/navigator/feature.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class RouteHolder {
  final String routeName;

  final IconData icon;

  String getRouteTitle(BuildContext context) ;

  const RouteHolder({required this.routeName, required this.icon});
}

class DashboardRoute extends RouteHolder {
  const DashboardRoute() : super(routeName: dashboardRoute, icon: Icons.dashboard);
  
  @override
  String getRouteTitle(BuildContext context) {
    throw UnimplementedError();
  }
}

class ExamPlaningsRoute extends RouteHolder {
  const ExamPlaningsRoute() : super(routeName: examPlaningsRoute, icon: Icons.event);
  
  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.examsPlanning;
  }
}

class GroupeAndSectionsRoute extends RouteHolder {
  const GroupeAndSectionsRoute()
      : super(routeName: groupeAndSectionsRoute, icon: Icons.group);


  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.groupAndSection;
  }
}

class ExamResultsRoute extends RouteHolder {
  const ExamResultsRoute() : super(routeName: examResultsRoute, icon: Icons.grade);

  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.examsResults;
  }
}

class EvaluationsRoute extends RouteHolder {
  const EvaluationsRoute()
      : super(routeName: evaluationsRoute, icon: Icons.assignment);


  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.evaluations;
  }
}

class ProfileRoute extends RouteHolder {
  const ProfileRoute() : super(routeName: profileRoute, icon: Icons.person);


  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.profile;
  }
}

class SettingsRoute extends RouteHolder {
  const SettingsRoute() : super(routeName: settingsRoute, icon: Icons.settings);


  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.settings;
  }
}

class LoginRoute extends RouteHolder {
  const LoginRoute() : super(routeName: loginRoute, icon: Icons.login);


  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.login;
  }
}

class BacRoute extends RouteHolder {
  const BacRoute() : super(routeName: bacRoute, icon: Icons.book);

  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.bacInfo;
  }
}

class SubscribtionsRoute extends RouteHolder {
  const SubscribtionsRoute()
      : super(routeName: subscribtionsRoute, icon: Icons.subscriptions);

  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.subscriptions;
  }
}

class AcademicVacationsRoute extends RouteHolder {
  const AcademicVacationsRoute()
      : super(routeName: academicVacationsRoute, icon: Icons.calendar_today);


  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.academicVacation;
  }
}

class ScholarDebtsRoute extends RouteHolder {
  const ScholarDebtsRoute() : super(routeName: creditsRoute, icon: Icons.credit_card);


  @override
  String getRouteTitle(BuildContext context) {
    return AppLocalizations.of(context)!.scholarDebt;
  }
}
