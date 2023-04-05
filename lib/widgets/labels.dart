import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/enums.dart';
import 'package:progresswebtu/constants/measures.dart';
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
  const InformationLabel(
      {super.key,
      required this.title,
      required this.text,
      this.textStyle,
      this.titleStyle});

  final String text;
  final String title;
  final TextStyle? textStyle;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final tStyle = textStyle ??
        Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.grey);

    final bStyle = textStyle ??
        Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppMeasures.examCardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: tStyle),
            Text(text, style: bStyle),
          ],
        ),
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle(
      {super.key,
      required this.title,
      this.isBold = false,
      this.size = TextSize.medium,
      this.color = Colors.black});

  final String title;
  final bool isBold;
  final TextSize size;
  final Color color;

  TextStyle _getStyle(TextTheme textTheme) {
    switch (size) {
      case TextSize.large:
        return textTheme.titleLarge!.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color);
      case TextSize.medium:
        return textTheme.titleMedium!.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color);
      case TextSize.small:
        return textTheme.titleSmall!.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(title, style: _getStyle(textTheme));
  }
}

class BodyText extends StatelessWidget {
  const BodyText(
      {super.key,
      required this.text,
      this.isBold = false,
      this.size = TextSize.medium,
      this.color = Colors.black});

  final String text;
  final bool isBold;
  final TextSize size;
  final Color color;

  TextStyle _getStyle(TextTheme textTheme) {
    switch (size) {
      case TextSize.large:
        return textTheme.bodyLarge!.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color);
      case TextSize.medium:
        return textTheme.bodyMedium!.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color);
      case TextSize.small:
        return textTheme.bodySmall!.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(text, style: _getStyle(textTheme));
  }
}

class BodyTextRow extends StatelessWidget {
  const BodyTextRow({super.key, required this.title, required this.content});

  final BodyText title;
  final BodyText content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [title, content],
    );
  }
}
