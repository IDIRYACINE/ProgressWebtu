import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:http/http.dart' as http;

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
  void onEvent(ServiceEvent event) {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      command.handleEvent(event.eventData);
    }
  }

  @override
  void onRawEvent(RawServiceEventData event) {
     Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      command.handleRawEvent(event);
    }
  }
}
