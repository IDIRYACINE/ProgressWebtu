import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/parser.dart';

class StudentCardViewLogic {
  static const id = "StudentCardViewLogic";
  final AppBloc bloc;

  StudentCardViewLogic(this.bloc);

  Future<void> loadStudentCard(AuthState state) async {
    String rawUsername = state.userName;
    String username = parseBacNumberFromUsername(rawUsername);
    String bacYear = parseBacYearFromUsername(rawUsername);

    final authToken = state.token;

    final data = StudentCardEventData(
        authKey: authToken,
        requesterId: id,
        bacYear: bacYear,
        username: username);

    final event = StudentCardEvent(eventData: data);

    ApiService.instance()
        .onEventForResponse(event)
        .then((response) => _updateStudentCardState);
  }

  void _updateStudentCardState(StudentCardResponse response) {
    final event = UpdateStudentCard(response.studentCard!);

    bloc.add(event);
  }
}
