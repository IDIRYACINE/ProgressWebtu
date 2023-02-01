import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'logic.dart';

class ExamsPlanningsView extends StatefulWidget {
  const ExamsPlanningsView({super.key});

  @override
  State<StatefulWidget> createState() => ExamsPlanningsViewState();
}

class ExamsPlanningsViewState extends State<ExamsPlanningsView> {
  @override
  Widget build(BuildContext context) {
    final logic = ExamsPlanningsViewLogic(BlocProvider.of<AppBloc>(context));

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        final status = state.examSessionsState.stateStatus;
        if (status == StateStatus.ready) {
          return _LoadedExamsSessions(
              sessions: state.examSessionsState.examSessions);
        } else if (status == StateStatus.loading) {
          final latestStudentCardSection = state.studentCardState.studentCardSections.first;

          int formationId = latestStudentCardSection.ouvertureOffreFormationId;
          int studyLevel = latestStudentCardSection.niveauId;

          logic.loadExamSessions(formationId, studyLevel,state.authState.token);

          return Center(child: Text(AppLocalizations.of(context)!.loading));
        } else {
          return Center(
              child: Text(AppLocalizations.of(context)!.couldNotLoadData));
        }
      }),
    );
  }
}

class _LoadedExamsSessions extends StatelessWidget {
  const _LoadedExamsSessions({required this.sessions});

  final List<ExamSessionModel> sessions;

  Widget buildSessionWidget(ExamSessionModel session) {
    return Card(
        child: Column(
      children: [
        Text(session.anneeAcademiqueCode),
        Text(session.intitule),
        Text(session.codePeriode),
        Text(session.dateDebut),
        Text(session.dateFin),
        Text(session.datePublication),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        for (ExamSessionModel session in sessions) buildSessionWidget(session)
      ],
    );
  }
}
