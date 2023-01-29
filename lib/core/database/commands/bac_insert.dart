
import 'package:progresswebtu/core/database/models/user.dart';
import 'package:progresswebtu/core/database/types.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:realm/realm.dart';

final insertBacCommandId = DatbaseCommands.insertBac.index;
final insertBacCommandName = DatbaseCommands.insertBac.name;

class InsertBacCommand
    extends Command<InsertBacData, InsertBacRawData, InsertBacResponse> {
  final Realm realm;

  InsertBacCommand(this.realm)
      : super(insertBacCommandId, insertBacCommandName);

  @override
  Future<InsertBacResponse> handleEvent(InsertBacData eventData) async {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<InsertBacResponse> handleRawEvent(InsertBacRawData eventData) async {
    final queryResult =
        realm.query<BacSummary>("id == '${eventData.oldBac.matricule}${eventData.oldBac.anneeBac}'");

    if (queryResult.isEmpty) {
      realm.write(() {
        realm.add(eventData.oldBac);
      });
    }

    return InsertBacResponse(messageId: eventData.messageId);
  }
}

class InsertBacData extends ServiceEventData<InsertBacRawData> {
  final BacSummary oldBac;

  InsertBacData({
    required this.oldBac,
   
    required String requesterId,
  }) : super(requesterId);

  @override
  InsertBacRawData toRawServiceEventData() {
    return InsertBacRawData(
      oldBac: oldBac,
      messageId: messageId,
      requesterId: requesterId,
      eventId: insertBacCommandId,
    
    );
  }
}

class InsertBacRawData extends RawServiceEventData {
  final BacSummary oldBac;


  InsertBacRawData({
    required this.oldBac,
    required int messageId,
    required String requesterId,
    required int eventId,
  }) : super(messageId, requesterId, eventId);
}

class InsertBacResponse extends ServiceEventResponse {
  BacSummary? bac;

  InsertBacResponse({
    this.bac,
    required int messageId,
    ServiceEventResponseStatus responseType =
        ServiceEventResponseStatus.success,
  }) : super(messageId, responseType);
}
