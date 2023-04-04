import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progresswebtu/constants/measures.dart';
import '../logic/logic.dart';
import 'general_view.dart';

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
          return Center(
              child: _LoadedBacSummary(bacSummary: state.bacSummaryState));
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

    return Padding(
      padding: const EdgeInsets.all(AppMeasures.bodyPaddingsMeduim),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GeneralBacView(
            bacSummary: bacSummary,
          )
        ],
      ),
    );
  }
}
