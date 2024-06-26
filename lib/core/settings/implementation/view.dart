import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/measures.dart';

import 'controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppMeasures.bodyPaddingsMeduim),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(children: [
          _ThemeSetting(controller: controller),
          _LanguageSetting(controller: controller),
        ]),
      ),
    );
  }
}

class _ThemeSetting extends StatelessWidget {
  final SettingsController controller;

  const _ThemeSetting({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.theme),
        DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          value: controller.themeMode,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: controller.updateThemeMode,
          items: [
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(AppLocalizations.of(context)!.lightTheme),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(AppLocalizations.of(context)!.darkTheme),
            )
          ],
        )
      ],
    );
  }
}

class _LanguageSetting extends StatelessWidget {
  final SettingsController controller;

  const _LanguageSetting({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.language),
        DropdownButton<LanguageMode>(
          value: controller.languageMode,
          onChanged: (language) => controller.updateLanguageMode(language),
          items: [
            DropdownMenuItem(
              value: LanguageMode.english,
              child: Text(AppLocalizations.of(context)!.english),
            ),
            DropdownMenuItem(
              value: LanguageMode.french,
              child: Text(AppLocalizations.of(context)!.french),
            ),
            DropdownMenuItem(
              value: LanguageMode.arabic,
              child: Text(AppLocalizations.of(context)!.arabic),
            )
          ],
        )
      ],
    );
  }
}
