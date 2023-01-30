import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'logic.dart';

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
          return _LoadedGroupsAndSections(
              sections: state.sectionsState.sections);
        } else if (status == StateStatus.loading) {
          final authState = state.authState;
          logic.loadSections(authState.userName, authState.token);

          return Center(child: Text(localizations.loading));
        } else {
          return Center(child: Text(localizations.couldNotLoadData));
        }
      }),
    );
  }
}

class _LoadedGroupsAndSections extends StatelessWidget {
  final List<SectionModel> sections;

  const _LoadedGroupsAndSections({required this.sections});

  Widget buildSection(BuildContext context, int index) {
    final section = sections[index];

    return Card(
      
      child: Column(children: [
        Text(section.nomSection),
        Text(section.periodeLibelleLongLt),
        Text(section.dateAffectation),
        Text(section.nomGroupePedagogique),
        Text(section.groupePedagogiqueId.toString()),
      ],),
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: buildSection,
    );
  }
}
