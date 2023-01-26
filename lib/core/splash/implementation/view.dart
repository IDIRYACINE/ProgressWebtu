

import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/metadata.dart';

import 'logic.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key,  this.settings, });

  final RouteSettings? settings;
  final SplashViewLogic logic = const SplashViewLogic();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);


    logic.loadStoredData();
    
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Center(
        child: Image.asset(AppMetadata.progressBannerAsset),
      ),
    );
  }
}