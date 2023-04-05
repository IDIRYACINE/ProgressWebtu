import 'package:flutter/material.dart';
import 'package:progresswebtu/appState/models/bilans.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/widgets/labels.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'mc_widget.dart';

class UeWidget extends StatelessWidget {
  const UeWidget({super.key, required this.ue});

  final BilanUeModel ue;

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).colorScheme.background;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: AppMeasures.ueCardMaxHeight),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppMeasures.examCardPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: _UeSummaryWidget(ue: ue)),
              Flexible(
                child: ListView.separated(
                  itemCount: ue.bilanMcs.length,
                  itemBuilder: (context, index) => McWidget(
                    mc: ue.bilanMcs[index],
                  ),
                  separatorBuilder: (context, index) => Divider(
                    height: AppMeasures.cardDividerHeight,
                    color: dividerColor,
                    thickness: AppMeasures.cardDividerThickness,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UeSummaryWidget extends StatelessWidget {
  const _UeSummaryWidget({required this.ue});
  final BilanUeModel ue;

  @override
  Widget build(BuildContext context) {
    final creditLabel = AppLocalizations.of(context)!.credit;
    final dividerColor = Theme.of(context).colorScheme.background;

    return Column(
      children: [
        TextTitle(title: ue.ueType),
        BodyTextRow(
          title: BodyText(text: creditLabel),
          content: BodyText(text: "${ue.creditAcquis}/${ue.credit}"),
        ),
        Divider(
          height: AppMeasures.cardDividerHeight,
          color: dividerColor,
          thickness: AppMeasures.cardDividerThickness,
        ),
      ],
    );
  }
}
