


import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? validateUsername(String? username,BuildContext context) {
  final validUsername = RegExp(r'[0-9]+$');

  if (username == null || username.isEmpty) {
    return AppLocalizations.of(context)!.usernameRequired;
  }

  if(!validUsername.hasMatch(username)){
    return AppLocalizations.of(context)!.usernameInvalid;
  }

  return null;
}

String? validatePassword(String? password,BuildContext context) {

  if (password == null || password.isEmpty) {
    return AppLocalizations.of(context)!.passwordRequired;
  }

  if(password.length < 4){
    return AppLocalizations.of(context)!.passwordTooShort;
  }

  return null;
}