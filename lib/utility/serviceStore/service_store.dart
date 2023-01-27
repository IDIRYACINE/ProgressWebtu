import 'dart:async';

import 'package:progresswebtu/utility/serviceStore/service.dart';

typedef VoidCallback = void Function();

abstract class ServiceStore {
  late List<Service> _services;
  final SearchAlgorithm<Service, int, Comparator> _searchAlgorithm;

  ServiceStore(this._searchAlgorithm);

  void registerService(Service service) {
    _services.add(service);
  }

  void unregisterService(Service service) {
    _services.remove(service);
  }

  void sendEvent(ServiceEvent event) {
    Service? service = _searchAlgorithm.search(_services, event.serviceId);
    if (service != null) {
      service.onEvent(event);
    }
  }
}

abstract class Service {
  late int serviceId;
  late String serviceName;
  late Stream stream;

  late List<Command> commands;

  final SearchAlgorithm<Command, int, Comparator> searchAlgorithm;

  Service(this.searchAlgorithm);

  void registerCommand(Command command) {
    commands.add(command);
  }

  void unregisterCommand(Command command) {
    commands.remove(command);
  }

  void unregisterCommandById(int commandId) {
    Command? command = searchAlgorithm.search(commands, commandId);
    if (command != null) {
      commands.remove(command);
    }
  }

  void onEvent(ServiceEvent event);
  void onRawEvent(RawServiceEventData event);
}

abstract class Command<A extends ServiceEventData ,B extends RawServiceEventData ,O extends ServiceEventResponse> {
  final int commandId;
  final String commandName;

  Command(this.commandId, this.commandName);

  Future<O> handleEvent(A eventData);
  Future<O> handleRawEvent(B eventData);
}

abstract class ServiceEvent {
  final int serviceId;
  final int eventId;
  final String eventName;

  final ServiceEventData eventData;

  late int messageId;

  ServiceEvent({
    required this.serviceId,
    required this.eventId,
    required this.eventName,
    required this.eventData,
  });
}

abstract class ServiceEventData<T extends RawServiceEventData> {
  final String requesterId;

  ServiceEventData(this.requesterId);

  T toRawServiceEventData(int messageId);
}

abstract class RawServiceEventData {
  final String requesterId;
  final int messageId;
  final int eventId;

  RawServiceEventData(this.messageId,this.requesterId, this.eventId);
}

enum ServiceEventResponseStatus {
  success,
  error,
}

abstract class ServiceEventResponse {
  final int messageId;
  final ServiceEventResponseStatus responseType;

  ServiceEventResponse(this.messageId, this.responseType);
}
