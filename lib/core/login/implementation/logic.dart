

import 'package:flutter/material.dart';
import 'package:progresswebtu/core/navigator/feature.dart';

class LoginLogic {
  LoginLogic();
  
  final formKey = GlobalKey<FormState>();

  String? _username;
  String? _password;


  void connect(){
    AppNavigator.pushNamedReplacement(dashboardRoute);
    if(formKey.currentState!.validate()){
      
    }
  }

  bool connectWithSharedPrefs(){
    return false;
  }

  void setUsername(String? username){
    _username = username;
  }

  void setPassword(String? password){
    _password = password;
  }

  void displayUsernameHint(BuildContext context){
    AppNavigator.displayDialog(_buildHintDialog());
  }


  void displayPasswordHint(BuildContext context){
    AppNavigator.displayDialog(_buildHintDialog());
  }

  Widget _buildHintDialog(){
    return AlertDialog(
      content: const Text('Hint'),
      actions: [
        TextButton(onPressed: () => AppNavigator.pop(), child: const Text('Ok'))
      ],
    );
  }
}