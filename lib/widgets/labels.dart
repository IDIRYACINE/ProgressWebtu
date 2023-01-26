import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/metadata.dart';

class ProgresBannerLabel extends StatelessWidget {
  const ProgresBannerLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Image.asset(AppMetadata.progressBannerAsset),
    );
  }
}
