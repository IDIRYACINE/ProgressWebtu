import 'package:flutter/material.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/constants/enums.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/widgets/labels.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeneralBacView extends StatelessWidget {
  const GeneralBacView({super.key, required this.bacSummary});

  final BacSummaryState bacSummary;

  @override
  Widget build(BuildContext context) {
    final anneBacLabel = AppLocalizations.of(context)!.anneeBac;
    final moyeneBacLabel = AppLocalizations.of(context)!.moyenneBac;

    return SizedBox(
      width: double.infinity,
      height: AppMeasures.examCardHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppMeasures.examCardPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(
                text: "${bacSummary.prenomFr} ${bacSummary.nomFr}",
                size: TextSize.large,
                isBold: true,
              ),
              BodyText(
                text: bacSummary.libelleSerieBac,
                size: TextSize.medium,
              ),
              BodyText(
                text: "$anneBacLabel ${bacSummary.anneeBac}",
                size: TextSize.medium,
              ),
              BodyText(
                text: "$moyeneBacLabel ${bacSummary.moyenneBac}",
                size: TextSize.medium,
                isBold: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
