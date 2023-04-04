import 'package:flutter/material.dart';
import 'package:progresswebtu/appState/models/exams.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/constants/metadata.dart';

import '../logic/helpers.dart';

class LoadedExamsNotes extends StatelessWidget {
  const LoadedExamsNotes({super.key, required this.examsNotes});

  final List<ExamsNoteModel> examsNotes;

  Widget itemBuilder(BuildContext context, int index) {
    final examNote = examsNotes[index];
    final theme = Theme.of(context);

    return Card(
      child: SizedBox(
        height: AppMeasures.examCardHeight,
        child: Padding(
          padding: const EdgeInsets.all(AppMeasures.examCardPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${examNote.examNote} / ${AppMetadata.maxExamResult}",
                      style: theme.textTheme.displaySmall,
                    ),
                    Text(examNote.mcLibelleFr, style: theme.textTheme.labelSmall),
                  ],
                ),
              ),
              SizedBox(
                  height: AppMeasures.examCardProgressHeight,
                  width: AppMeasures.examCardProgressWidth,
                  child: CircularProgressIndicator(
                      backgroundColor: theme.colorScheme.secondary,
                      value: examResultToCircularProgress(examNote.examNote)))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: itemBuilder, itemCount: examsNotes.length);
  }
}
