import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'logic.dart';

class BilansView extends StatefulWidget {
  const BilansView({super.key});

  @override
  State<StatefulWidget> createState() => BilansViewState();
}

class BilansViewState extends State<BilansView> {
  @override
  Widget build(BuildContext context) {
    final logic = BilansViewLogic(BlocProvider.of<AppBloc>(context));

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        final status = state.bilansState.stateStatus;
        if (status == StateStatus.ready) {
          return _LoadedBilans(bilans: state.bilansState.bilans);
        } else if (status == StateStatus.loading) {
          final authState =
              state.authState;


          logic.loadBilans(authState.userName, authState.token);

          return Center(child: Text(AppLocalizations.of(context)!.loading));
        } else {
          return Center(
              child: Text(AppLocalizations.of(context)!.couldNotLoadData));
        }
      }),
    );
  }
}

class _LoadedBilans extends StatelessWidget {
  const _LoadedBilans({required this.bilans});

  final List<SessionBilanModel> bilans;

  Widget buildBilanWidget(BuildContext context, int index) {
    final bilan = bilans[index];

    return Card(
        child: Column(
      children: [
        Text(bilan.niveauLibelleLongLt),
        Text(bilan.moyenne.toString()),
        Text(bilan.credit.toString()),
        Text(bilan.niveauCode),
        
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemBuilder: buildBilanWidget, itemCount: bilans.length);
  }
}
