import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/metadata.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/core/navigator/feature.dart';
import 'package:progresswebtu/widgets/dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLogic {
  LoginLogic();

  final formKey = GlobalKey<FormState>();

  String? _username;
  String? _password;

  void connect() {
    if (formKey.currentState!.validate()) {
      ApiService.instance().login(_username!, _password!,
          onSucess: _onLoginSuccess, onFail: _onLoginFail);
    }
  }

  Future<bool> connectWithSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString(AppMetadata.usernameSharedPrefKey) ?? '';
    final password = prefs.getString(AppMetadata.passwordSharedPrefKey) ?? '';

    if (username.isNotEmpty && password.isNotEmpty) {
      ApiService.instance().login(username, password, onSucess: (data) {
        AppNavigator.pushNamedReplacement(dashboardRoute);
      }, onFail: _onLoginFail);
    }

    return true;
  }

  void setUsername(String? username) {
    _username = username;
  }

  void setPassword(String? password) {
    _password = password;
  }

  void displayUsernameHint(BuildContext context) {
    AppNavigator.displayDialog(buildHintDialog());
  }

  void displayPasswordHint(BuildContext context) {
    AppNavigator.displayDialog(buildHintDialog());
  }

  Future<void> _onLoginSuccess(AuthResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppMetadata.usernameSharedPrefKey, _username!);
    prefs.setString(AppMetadata.passwordSharedPrefKey, _password!);

    AppNavigator.pushNamedReplacement(dashboardRoute);
  }

  void _onLoginFail() {
    AppNavigator.displayDialog(buildHintDialog("Wrong username or password"));
  }
}
