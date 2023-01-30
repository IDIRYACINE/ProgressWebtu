

import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/core/api/feature.dart';

class ExamNotesViewLogic {
  static const id = "ExamNotesViewLogic";

  final AppBloc bloc;

  const ExamNotesViewLogic(this.bloc);

  Future<void> loadExamNotes(String studyLevel, String token) async{

    final data = ExamNotesEventData(
        studyLevel: studyLevel,
        authKey: token,
        requesterId: id);
    final event = BacSummaryEvent(eventData: data);

    ApiService.instance().onEventForResponse(event).then((response) =>
        _sendUpdateExamNotesEvent(response as ExamNotesResponse));
  }

  void _sendUpdateExamNotesEvent(ExamNotesResponse response) {
    final event = UpdateExamNotes(response.examNotes!);

    bloc.add(event);
  }


}