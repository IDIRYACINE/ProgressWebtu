import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/parser.dart';

class ExamNotesViewLogic {
  static const id = "ExamNotesViewLogic";

  final AppBloc bloc;

  const ExamNotesViewLogic(this.bloc);

  Future<void> loadExamNotes(String studentId, String token) async {
    final data = ExamNotesEventData(
        studentId: studentId, authKey: token, requesterId: id);
    final event = ExamNotesEvent(eventData: data);

    ApiService.instance().onEventForResponse(event).then(
        (response) => _updateExamNotesState(response as ExamNotesResponse));
  }

  void _updateExamNotesState(ExamNotesResponse response) {
    final event = UpdateExamNotes(response.examNotes!);

    bloc.add(event);
  }

  void _updateStudentCardState(StudentCardResponse response, String authToken) {
    final event = UpdateStudentCard(response.studentCard!);

    bloc.add(event);

    final studentId = response.studentCard!.first.id.toString();

    loadExamNotes(studentId, authToken);
  }

  Future<void> loadData(AppState state) async {
    if (state.studentCardState.stateStatus != StateStatus.ready) {
      loadStudentCard(state);
      return;
    }

    final academicYearStudentId =
        state.studentCardState.studentCardSections.first.id;

    final authState = state.authState;
    loadExamNotes(academicYearStudentId.toString(), authState.token);
  }

  Future<void> loadStudentCard(AppState state) async {
    String rawUsername = state.authState.userName;
    String username = parseBacNumberFromUsername(rawUsername);
    String bacYear = parseBacYearFromUsername(rawUsername);

    final authToken = state.authState.token;

    final data = StudentCardEventData(
        authKey: authToken,
        requesterId: id,
        bacYear: bacYear,
        username: username);

    final event = StudentCardEvent(eventData: data);

    ApiService.instance().onEventForResponse(event).then((response) {
      _updateStudentCardState(response as StudentCardResponse, authToken);
    });
  }
}
