import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:http/http.dart' as http;

const serviceId = 0;

class ApiService extends Service {
  static ApiService? _instance;
  final http.Client client = http.Client();


  ApiService._internal(super.searchAlgorithm);

  factory ApiService.instance() {
    if (_instance == null) {
      BinarySearchAlgorithm<Command, int> searchAlgorithm =
          _createSearchAlgorithm();

      _instance = ApiService._internal(searchAlgorithm);
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

  void _registerDefaultCommands() {}

  @override
  void onEventForCallback(ServiceEvent event) {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      command.handleEvent(event.eventData).then((response) {
        event.callback??(response);
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
  Future<ServiceEventResponse> onEventForResponse(ServiceEvent<ServiceEventResponse> event) {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      command.handleEvent(event.eventData).then((response) {
        return event.callback??(response);
      });
    }
    return Future.value(UnhandeledEventResponse(event.eventData.messageId));

  }
}
