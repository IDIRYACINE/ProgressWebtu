import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/widgets/buttons.dart';
import '../logic/logic.dart';
import 'bilan_view.dart';

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
          final authState = state.authState;

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

class _LoadedBilans extends StatefulWidget {
  const _LoadedBilans({required this.bilans});

  final List<SessionBilanModel> bilans;

  @override
  State<_LoadedBilans> createState() => _LoadedBilansState();
}

class _LoadedBilansState extends State<_LoadedBilans> {
  int selectedIndex = 0;

  List<String> _getBilansTitles() {
    List<String> titles = [];
    for (SessionBilanModel bilan in widget.bilans) {
      titles.add("${bilan.niveauCode} ${bilan.periodeLibelleFr}");
    }

    return titles;
  }

  void _onIndexChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppMeasures.bodyPaddingsMeduim),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TabSwitcherButton(
            tabTitles: _getBilansTitles(),
            onIndexChanged: _onIndexChanged,
          ),
          Expanded(
              child: BilanView(
            bilan: widget.bilans[selectedIndex],
          )),
        ],
      ),
    );
  }
}
