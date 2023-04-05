import 'package:flutter/material.dart';
import 'package:progresswebtu/appState/models/models.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/widgets/labels.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ue_widget.dart';

class BilanView extends StatelessWidget {
  const BilanView({super.key, required this.bilan});

  final SessionBilanModel bilan;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _BilanSummaryWidget(bilan: bilan),
        Expanded(
          child: ListView.builder(
            itemCount: bilan.bilanUes.length,
            itemBuilder: (context, index) => UeWidget(
              ue: bilan.bilanUes[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _BilanSummaryWidget extends StatelessWidget {
  final SessionBilanModel bilan;

  const _BilanSummaryWidget({required this.bilan});

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.background;
    final moyenneGeneraleLabel = AppLocalizations.of(context)!.moyenneGenerale;
    final creditLabel = AppLocalizations.of(context)!.credit;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppMeasures.examCardPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BodyTextRow(
              title: BodyText(
                text: moyenneGeneraleLabel,
                color: titleColor,
              ),
              content: BodyText(text: bilan.moyenne.toString()),
            ),
            BodyTextRow(
              title: BodyText(
                text: creditLabel,
                color: titleColor,
              ),
              content: BodyText(text: bilan.creditAcquis.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
