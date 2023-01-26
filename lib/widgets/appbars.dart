import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/metadata.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    super.key,
    super.automaticallyImplyLeading = false,
    required VoidCallback onSettingsPressed,
  }) : super(title: const Text(AppMetadata.appName), actions: [
          IconButton(onPressed: onSettingsPressed, icon: const Icon(Icons.settings)),
        ]);
}
