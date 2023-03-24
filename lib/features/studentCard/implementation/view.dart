

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/constants/measures.dart';

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
          logic.loadStudentCard(state.authState);

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
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _Label(studentCardSection.anneeAcademiqueCode),
          _Label(studentCardSection.ofLlSpecialite),
          _Label(studentCardSection.ofLlSpecialiteArabe),
                  _Label(studentCardSection.ofLlFiliere),
          _Label(studentCardSection.ofLlFiliereArabe),
          _Label(studentCardSection.refLibelleCycle),
          _Label(studentCardSection.refLibelleCycleAr),
          _Label(studentCardSection.niveauLibelleLongAr),
          _Label(studentCardSection.niveauLibelleLongLt),
          _Label(studentCardSection.llEtablissementArabe),
          _Label(studentCardSection.llEtablissementLatin),
        ],
      ),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppMeasures.bodyPaddingsMeduim),
      child: ListView.builder(
          itemBuilder: itemBuilder, itemCount: studentCardSections.length),
    );
  }
}


class _Label extends StatelessWidget {
  final String value;

  const _Label(this.value, );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      value,
      style: theme.textTheme.bodyLarge );
  }
}
