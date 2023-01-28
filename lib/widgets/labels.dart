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

class InformationLabel extends StatelessWidget {
  const InformationLabel({super.key, required this.title , required this.text,this.textStyle});

  final String text;
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {

    final style = textStyle ?? Theme.of(context).textTheme.headline6;

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title, style: style),
          Text(text, style: style),
        ],
      ),
    );
  }
}