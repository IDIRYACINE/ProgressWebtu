import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/constants/metadata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progresswebtu/core/login/implementation/logic.dart';
import 'package:progresswebtu/core/splash/feature.dart';
import 'package:progresswebtu/utility/localized_validators.dart';
import 'package:progresswebtu/widgets/buttons.dart';
import 'package:progresswebtu/widgets/forms.dart';
import 'package:progresswebtu/widgets/labels.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginLogic logic = LoginLogic();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final data = ModalRoute.of(context)!.settings.arguments as StoredDataState;

    return Scaffold(
      body: Container(
        color: theme.scaffoldBackgroundColor,
        child: Form(
          key: logic.formKey,
          child: FutureBuilder(
              future: logic.connectWithSharedPrefs(data),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ProgresBannerLabel();
                }
                return Padding(
                  padding: const EdgeInsets.all(AppMeasures.bodyPaddings),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(AppMetadata.progressBannerAsset),
                      LoginTextForm(
                          inputLabel: AppLocalizations.of(context)!.username,
                          icon: Icons.email,
                          validator: (value) =>
                              validateUsername(value, context),
                          hintEnabled: true,
                          onHintPressed: () =>
                              logic.displayUsernameHint(context),
                          onChanged: logic.setUsername),
                      LoginTextForm(
                        inputLabel: AppLocalizations.of(context)!.password,
                        icon: Icons.lock,
                        validator: (value) => validatePassword(value, context),
                        hintEnabled: true,
                        onHintPressed: () => logic.displayPasswordHint(context),
                        onChanged: logic.setPassword,
                      ),
                      ConnectButton(onPressed: () => logic.connect())
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
