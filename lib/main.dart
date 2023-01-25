import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:progresswebtu/constants/metadata.dart';
import 'package:progresswebtu/constants/themes.dart';
import 'package:progresswebtu/core/navigator/feature.dart';

import 'core/login/feature.dart';
import 'core/settings/feature.dart';

void main() {
  SettingsService settingsService = SettingsService();
  SettingsController settingsController = SettingsController(settingsService);

  runApp(MyApp(
    settingsController: settingsController,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return BinderScope(
      child: AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            navigatorKey: AppNavigator.key,
            title: Metadata.appName,
            theme: AppThemes.lightTheme,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('fr'), Locale("ar")],
            onGenerateRoute: AppRouter.generateRoutes,
            home: const AuthWrapper(),
          );
        }
      ),
    );
  }
}
