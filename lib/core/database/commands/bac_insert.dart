
import 'package:progresswebtu/core/database/models/user.dart';
import 'package:progresswebtu/core/database/types.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:realm/realm.dart';

final insertBacCommandId = DatbaseCommands.insertBac.index;
final insertBacCommandName = DatbaseCommands.insertBac.name;

class InsertBacCommand
    extends Command<insertBacData, insertBacRawData, insertBacResponse> {
  final Realm realm;

  InsertBacCommand(this.realm)
      : super(insertBacCommandId, insertBacCommandName);

  @override
  Future<insertBacResponse> handleEvent(insertBacData eventData) async {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<insertBacResponse> handleRawEvent(insertBacRawData eventData) async {
    final queryResult =
        realm.query<BacSummary>("id == '${eventData.oldBac.matricule}${eventData.oldBac.anneeBac}'");

    if (queryResult.isEmpty) {
      realm.write(() {
        realm.add(eventData.oldBac);
      });
    }

    return insertBacResponse(messageId: eventData.messageId);
  }
}

class insertBacData extends ServiceEventData<insertBacRawData> {
  final BacSummary oldBac;

  insertBacData({
    required this.oldBac,
   
    required String requesterId,
  }) : super(requesterId);

  @override
  insertBacRawData toRawServiceEventData() {
    return insertBacRawData(
      oldBac: oldBac,
      messageId: messageId,
      requesterId: requesterId,
      eventId: insertBacCommandId,
    
    );
  }
}

class insertBacRawData extends RawServiceEventData {
  final BacSummary oldBac;


  insertBacRawData({
    required this.oldBac,
    required int messageId,
    required String requesterId,
    required int eventId,
  }) : super(messageId, requesterId, eventId);
}

class insertBacResponse extends ServiceEventResponse {
  BacSummary? bac;

  insertBacResponse({
    this.bac,
    required int messageId,
    ServiceEventResponseStatus responseType =
        ServiceEventResponseStatus.success,
  }) : super(messageId, responseType);
}
