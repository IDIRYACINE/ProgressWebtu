import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progresswebtu/widgets/labels.dart';
import 'logic.dart';

class BacInformationsView extends StatefulWidget {
  const BacInformationsView({super.key});

  @override
  State<StatefulWidget> createState() => BacInformationsViewState();
}

class BacInformationsViewState extends State<BacInformationsView> {
  final logic = BacViewLogic();

  @override
  Widget build(BuildContext context) {
    logic.setWidgetContext(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        final status = state.bacSummaryState.stateStatus;
        if (status == StateStatus.ready) {
          return _LoadedBacSummary(bacSummary: state.bacSummaryState);
        } else if (status == StateStatus.loading) {
          final authState = state.authState;
          logic.loadBacSummary(authState.userName, authState.token);

          return Center(child: Text(AppLocalizations.of(context)!.loading));
        } else {
          return Center(
              child: Text(AppLocalizations.of(context)!.couldNotLoadData));
        }
      }),
    );
  }
}

class _LoadedBacSummary extends StatelessWidget {
  const _LoadedBacSummary({required this.bacSummary});

  final BacSummaryState bacSummary;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        InformationLabel(
            title: localizations.anneeBac, text: bacSummary.anneeBac),
        InformationLabel(
            title: localizations.dateNaissance, text: bacSummary.dateNaissance),
        InformationLabel(
            title: localizations.moyenneBac, text: bacSummary.moyenneBac),
        InformationLabel(title: localizations.nomFr, text: bacSummary.nomFr),
        InformationLabel(
            title: localizations.prenomFr, text: bacSummary.prenomFr),
        InformationLabel(title: localizations.nomAr, text: bacSummary.nomAr),
        InformationLabel(
            title: localizations.prenomAr, text: bacSummary.prenomAr),
      ],
    );
  }
}
