

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progresswebtu/appState/state.dart';

import 'logic.dart';

class StudentCardView extends StatelessWidget {
  const StudentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final logic = StudentCardViewLogic(BlocProvider.of<AppBloc>(context));

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        final status = state.studentCardState.stateStatus;

        if (status == StateStatus.ready) {
          return _LoadedStudentCard(
              studentCardSections: state.studentCardState.studentCardSections);
        } else if (status == StateStatus.loading) {
          final authState = state.authState;
          logic.loadStudentCard(authState.userName,authState.token);

          return Center(child: Text(localizations.loading));
        } else {
          return Center(child: Text(localizations.couldNotLoadData));
        }
      }),
    );
  }
}

class _LoadedStudentCard extends StatelessWidget {
  const _LoadedStudentCard({required this.studentCardSections});

  final List<StudentCardModel> studentCardSections;

  Widget itemBuilder(BuildContext context, int index) {
    final studentCardSection = studentCardSections[index];
    return Card(child: 
    Column(
      children: [
        Text(studentCardSection.anneeAcademiqueCode),
        Text(studentCardSection.ofLlSpecialite),
        Text(studentCardSection.ofLlSpecialiteArabe),
                Text(studentCardSection.ofLlFiliere),
        Text(studentCardSection.ofLlFiliereArabe),
        Text(studentCardSection.refLibelleCycle),
        Text(studentCardSection.refLibelleCycleAr),
        Text(studentCardSection.niveauLibelleLongAr),
        Text(studentCardSection.niveauLibelleLongLt),
        Text(studentCardSection.llEtablissementArabe),
        Text(studentCardSection.llEtablissementLatin),
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: itemBuilder, itemCount: studentCardSections.length);
  }
}