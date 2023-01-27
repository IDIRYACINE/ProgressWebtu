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
  final int serviceId;
  final String serviceName;
  late Stream stream;

  late List<Command> commands;

    final SearchAlgorithm<Command, int, Comparator> _searchAlgorithm;


  Service(this.serviceId, this.serviceName, this._searchAlgorithm);

  void registerCommand(Command command) {
    commands.add(command);
  }

  void unregisterCommand(Command command) {
    commands.remove(command);
  }

  void unregisterCommandById(int commandId) {
    Command? command = _searchAlgorithm.search(commands, commandId);
    if (command != null) {
      commands.remove(command);
    }
  }

  void onEvent(ServiceEvent event);
  void onRawEvent(RawServiceEventData event);
}


abstract class Command{
  final int commandId;
  final String commandName;

  Command(this.commandId, this.commandName);

  ServiceEventResponse execute(ServiceEventData eventData);

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

abstract class ServiceEventData {
  final String requesterId;

  ServiceEventData(this.requesterId);

  RawServiceEventData toRawServiceEventData(int messageId);
}

abstract class RawServiceEventData {
  final String requesterId;
  final int messageId;
  final int eventId;

  RawServiceEventData(this.requesterId, this.messageId, this.eventId);
}

abstract class ServiceEventResponse {
  final int messageId;

  ServiceEventResponse(this.messageId);
}
