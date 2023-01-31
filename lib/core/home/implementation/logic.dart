

import 'package:flutter/material.dart';
import 'package:progresswebtu/core/navigator/feature.dart';

import '../models/routes_holders.dart';

class HomeViewLogic {
  const HomeViewLogic();


  final List<RouteHolder> routes = const [
    ExamPlaningsRoute(),
    GroupeAndSectionsRoute(),
    ExamResultsRoute(),
    EvaluationsRoute(),
    ScholarDebtsRoute(),
    BacRoute(),
    StudentCardRoute()
  ];

  Widget gridItemBuilder(BuildContext context, int index) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: () => AppNavigator.pushNamed(routes[index].routeName),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(routes[index].icon),
          Text(routes[index].getRouteTitle(context)),
        ],
      ),
    );
  }

  void onSettingsPressed() {
    AppNavigator.pushNamed(settingsRoute);
  }

}