import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/constants/metadata.dart';
import 'package:progresswebtu/constants/themes.dart';
import 'package:progresswebtu/core/navigator/feature.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/settings/feature.dart';

void main() {
  SettingsService settingsService = SettingsService();
  SettingsController settingsController = SettingsController(settingsService);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AppBloc>(
        create: (BuildContext context) => AppBloc(),
      ),
    ],
    child: MyApp(
      settingsController: settingsController,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            navigatorKey: AppNavigator.key,
            title: AppMetadata.appName,
            theme: AppThemes.lightTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('fr'), Locale('en'), Locale("ar")],
            onGenerateRoute: AppRouter.generateRoutes,
            locale: settingsController.locale,
            initialRoute: loadingRoute,
            
          );
        });
  }
}
