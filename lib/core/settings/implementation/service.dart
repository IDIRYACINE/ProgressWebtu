import 'package:flutter/material.dart';

import 'controller.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.light;

  Future<LanguageMode> languageMode() async => LanguageMode.english;

  Future<void> updateThemeMode(ThemeMode theme) async {
  }

  Future<void> updateLanguageMode(LanguageMode newLanguageMode) async{

  }
}
