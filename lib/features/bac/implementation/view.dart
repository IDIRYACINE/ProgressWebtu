
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'logic.dart';

class BacInformationsView extends StatefulWidget {
  const BacInformationsView({super.key = const Key('BacInformationsView')});

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

          return  Center(child: Text(AppLocalizations.of(context)!.loading));
        } else {
          return Center(child: Text(AppLocalizations.of(context)!.couldNotLoadData));
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
    return Column(
      children: [
        Text("anne Bac : ${bacSummary.anneeBac}"),
        Text("date naissance : ${bacSummary.dateNaissance}"),
        Text("moyenneBac : ${bacSummary.moyenneBac}"),
        Text("nom Fr : ${bacSummary.nomFr}"),
        Text("nom Ar : ${bacSummary.nomAr}"),
        Text("prenom Fr : ${bacSummary.prenomFr}"),
        Text("prenom Ar : ${bacSummary.prenomAr}"),
      ],
    );
  }
}
