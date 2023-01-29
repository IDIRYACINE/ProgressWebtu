import 'package:progresswebtu/core/api/commands/academic_year_all.dart';
import 'package:progresswebtu/core/api/commands/bac_notes.dart';
import 'package:progresswebtu/core/api/commands/bac_summary.dart';
import 'package:progresswebtu/core/api/commands/current_academic_year.dart';
import 'package:progresswebtu/core/api/commands/exam_notes.dart';
import 'package:progresswebtu/core/api/commands/exam_session.dart';
import 'package:progresswebtu/core/api/commands/login.dart';
import 'package:progresswebtu/core/api/commands/semestre_summary.dart';
import 'package:progresswebtu/core/api/implementation/apis.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:http/http.dart' as http;

const serviceId = 0;

class ApiService extends Service {
  static ApiService? _instance;
  final http.Client client = http.Client();
  final bool isTestMode;

  ApiService._internal(this.isTestMode, super.searchAlgorithm);

  factory ApiService.instance([bool isTestMode = true]) {
    if (_instance == null) {
      BinarySearchAlgorithm<Command, int> searchAlgorithm =
          _createSearchAlgorithm();

      _instance = ApiService._internal(isTestMode, searchAlgorithm);
      _instance!._registerDefaultCommands();
    }

    return _instance!;
  }

  static BinarySearchAlgorithm<Command, int> _createSearchAlgorithm() {
    BinarySearchComparator<Command, int> comparator = BinarySearchComparator(
        isGreaterThan: (Command command, int target) =>
            command.commandId > target,
        isLessThan: (Command command, int target) =>
            command.commandId < target);

    BinarySearchAlgorithm<Command, int> searchAlgorithm =
        BinarySearchAlgorithm(comparator);

    return searchAlgorithm;
  }

  void _registerDefaultCommands() {
    commands = List.filled(
      Apis.values.length,
      EmptyCommand(-1),
    );

    final postmanTestHeader = {postmanApiHeader: postmanApiKey};

    replaceCommandAtIndex(LoginCommand(isTestMode ? postmanTestHeader : {}));
    replaceCommandAtIndex(BacNotesCommand(isTestMode ? postmanTestHeader : {}));
    replaceCommandAtIndex(
        BacSummaryCommand(isTestMode ? postmanTestHeader : {}));
    replaceCommandAtIndex(
        ExamNotesCommand(isTestMode ? postmanTestHeader : {}));
    replaceCommandAtIndex(
        CurrentAcademicYearCommand(isTestMode ? postmanTestHeader : {}));
    replaceCommandAtIndex(
        AcademicYearAllCommand(isTestMode ? postmanTestHeader : {}));
    replaceCommandAtIndex(
        ExamSessionsCommand(isTestMode ? postmanTestHeader : {}));
    replaceCommandAtIndex(
        SemestreSummaryCommand(isTestMode ? postmanTestHeader : {}));
  }

  @override
  void onEventForCallback(ServiceEvent event) {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      command.handleEvent(event.eventData).then((response) {
        event.callback?.call(response);
      });
    }
  }

  @override
  Future<ServiceEventResponse> onRawEvent(RawServiceEventData event) {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      return command.handleRawEvent(event);
    }
    return Future.value(UnhandeledEventResponse(event.messageId));
  }

  @override
  Future<ServiceEventResponse> onEventForResponse(
      ServiceEvent<ServiceEventResponse> event) {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      return command.handleEvent(event.eventData);
    }
    return Future.value(UnhandeledEventResponse(event.eventData.messageId));
  }
}
