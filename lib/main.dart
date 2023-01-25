import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:progresswebtu/constants/metadata.dart';
import 'package:progresswebtu/constants/themes.dart';
import 'package:progresswebtu/core/navigator/feature.dart';

import 'core/login/feature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BinderScope(
      child: MaterialApp(
        navigatorKey: AppNavigator.key,
        title: Metadata.appName,
        theme: AppThemes.lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), 
          Locale('fr'), 
          Locale("ar")
        ],
        home: const AuthWrapper(),
      ),
    );
  }
}
