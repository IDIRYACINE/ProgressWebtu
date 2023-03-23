import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../logic/logic.dart';
import 'group_section_view.dart';

class GroupsAndSectionsView extends StatelessWidget {
  const GroupsAndSectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final SectionsLogic logic = SectionsLogic();

    logic.context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.groupAndSection),
      ),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        final status = state.sectionsState.stateStatus;
        if (status == StateStatus.ready) {
          return LoadedGroupsAndSections(
              sections: state.sectionsState.sections);
        } else if (status == StateStatus.loading) {
          final studentId = state.studentCardState.studentCardSections.first.id.toString();
          logic.loadSections(studentId, state.authState.token);

          return Center(child: Text(localizations.loading));
        } else {
          return Center(child: Text(localizations.couldNotLoadData));
        }
      }),
    );
  }
}
