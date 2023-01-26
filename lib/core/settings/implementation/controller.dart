import 'package:flutter/material.dart';

import 'service.dart';

class SettingsController with ChangeNotifier {
  static SettingsController? _instance;

  SettingsController._(this._settingsService);

  factory SettingsController(SettingsService settingsService) {
    _instance ??= SettingsController._(settingsService);
    return _instance!;
  }

  static SettingsController get instance => _instance!;

  final SettingsService _settingsService;

  late ThemeMode _themeMode;
  late LanguageMode _languageMode;

  Locale _locale = const Locale('fr');

  ThemeMode get themeMode => _themeMode;

  LanguageMode get languageMode => _languageMode;

  Locale get locale => _locale;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _languageMode = await _settingsService.languageMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateLanguageMode(LanguageMode? newLanguageMode) async {
    if (newLanguageMode == null) return;

    if (newLanguageMode == _languageMode) return;

    switch (newLanguageMode) {
      case LanguageMode.english:
        _locale = const Locale('en');
        break;
      case LanguageMode.french:
        _locale = const Locale('fr');
        break;
      case LanguageMode.arabic:
        _locale = const Locale('ar');
        break;
    }

    _languageMode = newLanguageMode;

    notifyListeners();

    await _settingsService.updateLanguageMode(newLanguageMode);
  }
}

enum LanguageMode { english, french, arabic }
