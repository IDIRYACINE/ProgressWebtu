import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/metadata.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/core/navigator/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:progresswebtu/widgets/dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginLogic {
  LoginLogic();
  static const id = "LoginLogic";

  final formKey = GlobalKey<FormState>();

  String? _username;
  String? _password;

  void connect() {
    if (formKey.currentState!.validate()) {
      _sendLoginEvent(_username!, _password!);
    }
  }

  void _sendLoginEvent(String username, String password) {
    final service = ApiService.instance();
    
    final eventData = LoginEventData(
        username: username, password: password,  requesterId: id);
    final event = LoginEvent(eventData: eventData , callback: _handleLoginResponse);
    
    service.onEventForCallback(event);
  }

  Future<bool> connectWithSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString(AppMetadata.usernameSharedPrefKey) ?? '';
    final password = prefs.getString(AppMetadata.passwordSharedPrefKey) ?? '';

    if (username.isNotEmpty && password.isNotEmpty) {
      _sendLoginEvent(username, password);
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

  Future<void> _onLoginSuccess(LoginResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppMetadata.usernameSharedPrefKey, _username!);
    prefs.setString(AppMetadata.passwordSharedPrefKey, _password!);

    AppNavigator.pushNamedReplacement(dashboardRoute);
  }

  void _onLoginFail() {
    AppNavigator.displayDialog(buildHintDialog("Wrong username or password"));
  }

  void _handleLoginResponse(AuthEventResponse response) {
    if (response.responseType == ServiceEventResponseStatus.success) {
      _onLoginSuccess(response.authResponse!);
    } else {
      _onLoginFail();
    }
  }
}
