import 'package:progresswebtu/core/api/commands/commands.dart';
import 'package:progresswebtu/core/api/implementation/apis.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:http/http.dart' as http;

const serviceId = 0;

class ApiService extends Service {
  static ApiService? _instance;
  final http.Client client = http.Client();

  ApiService._internal( super.searchAlgorithm);

  factory ApiService.instance() {
    if (_instance == null) {
      BinarySearchAlgorithm<Command, int> searchAlgorithm =
          _createSearchAlgorithm();

      _instance = ApiService._internal( searchAlgorithm);
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
    final utf8Header = {contentTypeHeader: utf8ContentType};

    replaceCommandAtIndex(LoginCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(BacNotesCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        BacSummaryCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        ExamNotesCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        CurrentAcademicYearCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        StudentCardCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        ExamSessionsCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        SemestreSummaryCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        AllSessionsBilansCommand(isTestMode ? postmanTestHeader : utf8Header));
    replaceCommandAtIndex(
        SectionsAndGroupsCommand(isTestMode ? postmanTestHeader : utf8Header));
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
  Future<ServiceEventResponse> onRawEvent(RawServiceEventData event) async {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      return command.handleRawEvent(event);
    }
    return UnhandeledEventResponse(event.messageId);
  }

  @override
  Future<ServiceEventResponse> onEventForResponse(
      ServiceEvent<ServiceEventResponse> event) async {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      return command.handleEvent(event.eventData);
    }
    return UnhandeledEventResponse(event.eventData.messageId);
  }
}
