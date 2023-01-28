import 'dart:async';

import 'package:progresswebtu/utility/serviceStore/service.dart';

typedef VoidCallback = void Function();
typedef ServiceCallback<T> = void Function(T);

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
      service.onEventForCallback(event);
    }
  }
}

abstract class Service{
  late int serviceId;
  late String serviceName;
  late Stream stream;

  late List<Command> commands;

  final SearchAlgorithm<Command, int, Comparator> searchAlgorithm;

  Service(this.searchAlgorithm);

  void registerCommand(Command command) {
    commands.add(command);
  }

  void registerCommandAtIndex(Command command) {
    commands.insert(command.commandId, command);
  }

  void replaceCommandAtIndex(Command command) {
    commands[command.commandId] = command;
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

  void onEventForCallback(ServiceEvent event);
  Future<ServiceEventResponse> onEventForResponse(ServiceEvent event);
  Future<ServiceEventResponse> onRawEvent(RawServiceEventData event);
}

abstract class Command<A extends ServiceEventData,
    B extends RawServiceEventData, O extends ServiceEventResponse> {
  final int commandId;
  final String commandName;

  Command(this.commandId, this.commandName);

  Future<O> handleEvent(A eventData);
  Future<O> handleRawEvent(B eventData);
}

class EmptyCommand extends Command{
  EmptyCommand(int commandId) : super(commandId, "EmptyCommand");

  @override
  Future<ServiceEventResponse> handleEvent(ServiceEventData<RawServiceEventData> eventData) {
    throw UnimplementedError("EmptyCommand");
  }

  @override
  Future<ServiceEventResponse> handleRawEvent(RawServiceEventData eventData) {
    throw UnimplementedError("EmptyCommand");
  }

}

abstract class ServiceEvent<R extends ServiceEventResponse> {
  final int serviceId;
  final int eventId;
  final String eventName;

  final ServiceEventData eventData;

  final ServiceCallback<R>? callback;

  ServiceEvent(
    this.eventId,
    this.eventName,
    this.serviceId, {
    this.callback,
    required this.eventData,
  });
}

abstract class ServiceEventData<T extends RawServiceEventData> {
  final String requesterId;
  int messageId = 0;

  ServiceEventData(this.requesterId);

  T toRawServiceEventData();

  void setMessageId(int messageId) {
    this.messageId = messageId;
  }
}

abstract class RawServiceEventData {
  final String requesterId;
  final int messageId;
  final int eventId;

  RawServiceEventData(this.messageId, this.requesterId, this.eventId);
}

enum ServiceEventResponseStatus {
  success,
  error,
  unhandled,
}

abstract class ServiceEventResponse {
  final int messageId;
  final ServiceEventResponseStatus responseType;

  ServiceEventResponse(this.messageId, this.responseType);
}

class UnhandeledEventResponse extends ServiceEventResponse {
  UnhandeledEventResponse(int messageId)
      : super(messageId, ServiceEventResponseStatus.unhandled);
}
