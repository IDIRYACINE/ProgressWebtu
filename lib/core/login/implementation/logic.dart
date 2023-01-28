import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart' as bloc;
import 'package:progresswebtu/constants/metadata.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/core/navigator/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:progresswebtu/widgets/dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    final eventData =
        LoginEventData(username: username, password: password, requesterId: id);
    final event =
        LoginEvent(eventData: eventData, callback: _handleLoginResponse);

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
    prefs.setString(AppMetadata.authTokenSharedPrefKey, response.token);
    prefs.setString(
        AppMetadata.authTokenExpirationSharedPrefKey, response.expirationDate);

    BlocProvider.of<bloc.AppBloc>(formKey.currentContext!)
        .add(bloc.UpdateAuthState(response));

    AppNavigator.pushNamedReplacement(dashboardRoute);
  }

  void _onLoginFail() {
    AppNavigator.displayDialog(buildHintDialog(
        AppLocalizations.of(formKey.currentContext!)!.wrongUsernameOrPassword));
  }

  void _handleLoginResponse(ServiceEventResponse response) {
    response = response as AuthEventResponse;

    if (response.responseType == ServiceEventResponseStatus.success) {
      _onLoginSuccess(response.authResponse!);
    } else {
      _onLoginFail();
    }
  }
}
