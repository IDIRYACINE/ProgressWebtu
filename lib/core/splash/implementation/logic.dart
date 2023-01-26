

import 'package:progresswebtu/constants/metadata.dart';
import 'package:progresswebtu/core/navigator/feature.dart';
import 'package:progresswebtu/core/settings/feature.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashViewLogic {


  const SplashViewLogic();


  Future<void> loadStoredData() async{

    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString(AppMetadata.usernameSharedPrefKey) ?? '';
    final password = prefs.getString(AppMetadata.passwordSharedPrefKey) ?? '';

    final storedData = StoredDataState(username, password, prefs);

    await SettingsController.instance.loadSettings();

    await Future.delayed(const Duration(seconds: 2));

    AppNavigator.pushNamedReplacement(loginRoute, arguments: storedData);

  }

}

class StoredDataState {
  final String username;
  final String password;
  SharedPreferences? prefs;

  StoredDataState(this.username, this.password,[this.prefs]);

  static defaultInstance() => StoredDataState('', '');
}