import 'package:progresswebtu/core/database/models/user.dart';
import 'package:progresswebtu/core/database/types.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:realm/realm.dart';

final queryBacCommandId = DatbaseCommands.queryBac.index;
final queryBacCommandName = DatbaseCommands.queryBac.name;

class QueryBacCommand
    extends Command<QueryBacData, QueryBacRawData, QueryBacResponse> {
  final Realm realm;

  QueryBacCommand(this.realm)
      : super(queryBacCommandId, queryBacCommandName);

  @override
  Future<QueryBacResponse> handleEvent(QueryBacData eventData) async{
   return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<QueryBacResponse> handleRawEvent(QueryBacRawData eventData) async{
    final bac = realm.query<BacSummary>("id == '${eventData.matricule}${eventData.anneBac}'").first;
    final response = QueryBacResponse(bac: bac,messageId: eventData.messageId);

    return response;
  }
}

class QueryBacData extends ServiceEventData<QueryBacRawData> {
  final String matricule;
  final String anneBac;

  QueryBacData({
    required this.matricule,
    required this.anneBac,
    required String requesterId,
  }) : super(requesterId);

  @override
  QueryBacRawData toRawServiceEventData() {
   return QueryBacRawData(
      matricule: matricule,
      anneBac: anneBac,
      messageId: messageId,
      requesterId: requesterId,
      eventId: queryBacCommandId,
    );
  }
}

class QueryBacRawData extends RawServiceEventData {
   final String matricule;
  final String anneBac;

  QueryBacRawData( {
       required this.matricule,
    required this.anneBac,
    required int messageId,
    required String requesterId,
    required int eventId,
  }) : super(messageId, requesterId, eventId);
}

class QueryBacResponse extends ServiceEventResponse {
  BacSummary? bac;

  QueryBacResponse({
    this.bac,
    required int messageId,
    ServiceEventResponseStatus responseType =
        ServiceEventResponseStatus.success,
  }) : super(messageId, responseType);
}
