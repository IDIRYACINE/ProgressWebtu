import 'package:flutter/material.dart';
import 'package:progresswebtu/appState/models/bilans.dart';
import 'package:progresswebtu/widgets/labels.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class McWidget extends StatelessWidget {
  const McWidget({super.key, required this.mc});

  final BilanMcModel mc;

  @override
  Widget build(BuildContext context) {


    final controlContinueLabel = AppLocalizations.of(context)!.controlContinu;
    final examLabel = AppLocalizations.of(context)!.examNote;
    final coefficientLabel = AppLocalizations.of(context)!.coefficient;

    final titleColor = Theme.of(context).colorScheme.background;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodyTextRow(
          title:BodyText(text: mc.mcLibelleFr),
          content:BodyText(text: mc.moyenneGenerale.toString()),
        ),
        BodyTextRow(
          title: BodyText(text:controlContinueLabel ,color: titleColor,),
          content: BodyText(text: mc.moyenneControleContinu.toString()),
        ),
        BodyTextRow(
          title:BodyText(text:examLabel ,color: titleColor,),
          content: BodyText(text:mc.noteExamen.toString()),
        ),
        BodyTextRow(
          title: BodyText(text:coefficientLabel ,color: titleColor,),
          content:BodyText(text:mc.coefficient.toString()),
        ),
      ],
    );
  }
}
