import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/core/api/feature.dart';

class ExamsPlanningsViewLogic {
  static const id = "ExamsPlanningsViewLogic";
  final AppBloc bloc;

  ExamsPlanningsViewLogic(this.bloc);

  void loadExamSessions(int formationId, int studyLevel, String token) {
    final data = ExamSessionsEventData(
        formationId: formationId.toString(),
        studyLevel: studyLevel.toString(),
        authKey: token,
        requesterId: id);

    final event = ExamSessionEvent(eventData: data);

    ApiService.instance().onEventForResponse(event).then((response) =>
        _sendUpdateExamSessionsEvent(response as ExamSessionsResponse));
  }

  _sendUpdateExamSessionsEvent(ExamSessionsResponse response) {
    final event = UpdateExamSessions(response.examSessions!);

    bloc.add(event);
  }
}
