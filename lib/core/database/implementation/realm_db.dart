import 'package:progresswebtu/core/database/database.dart';
import 'package:progresswebtu/core/database/types.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:realm/realm.dart';

class RealmDb extends Service {
  static RealmDb? _instance;
  late Realm realm;

  RealmDb._internal(this.realm, super.searchAlgorithm);

  factory RealmDb() {
    if (_instance == null) {
      BinarySearchAlgorithm<Command, int> searchAlgorithm =
          _createSearchAlgorithm();

      final dbConfig = Configuration.local(
          [AppUser.schema, Section.schema, BacSummary.schema]);
      final realm = Realm(dbConfig);

      _instance = RealmDb._internal(realm, searchAlgorithm);

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
      DatbaseCommands.values.length,
      EmptyCommand(-1),
    );

    replaceCommandAtIndex(QueryAppUserCommand(realm));
    replaceCommandAtIndex(UpdateAppUserCommand(realm));
    replaceCommandAtIndex(QueryBacCommand(realm));
    replaceCommandAtIndex(InsertBacCommand(realm));
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
