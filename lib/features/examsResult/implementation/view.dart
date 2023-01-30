import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/features/examsResult/implementation/logic.dart';
import 'package:progresswebtu/widgets/labels.dart';

class ExamsResultView extends StatelessWidget {
  const ExamsResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final logic = ExamNotesViewLogic(BlocProvider.of<AppBloc>(context));

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        final status = state.examNotes.stateStatus;

        if (status == StateStatus.ready) {
          return _LoadedExamsNotes(examsNotes: state.examNotes.examResults);
        } else if (status == StateStatus.loading) {
          final academicYearStudentId =
              state.studentCardState.studentCardSections.first.id;

          final authState = state.authState;
          logic.loadExamNotes(
              academicYearStudentId.toString(), authState.token);

          return Center(child: Text(localizations.loading));
        } else {
          return Center(child: Text(localizations.couldNotLoadData));
        }
      }),
    );
  }
}

class _LoadedExamsNotes extends StatelessWidget {
  const _LoadedExamsNotes({required this.examsNotes});

  final List<ExamsNoteModel> examsNotes;

  Widget itemBuilder(BuildContext context, int index) {
    final examNote = examsNotes[index];
    return InformationLabel(
        title: examNote.mcLibelleFr, text: examNote.moyenneGenerale.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: itemBuilder, itemCount: examsNotes.length);
  }
}
