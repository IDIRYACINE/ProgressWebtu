import 'package:progresswebtu/core/database/models/user.dart';
import 'package:progresswebtu/core/database/types.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:realm/realm.dart';

final queryAppUserCommandId = DatbaseCommands.queryAppUser.index;
final queryAppUserCommandName = DatbaseCommands.queryAppUser.name;

class QueryAppUserCommand
    extends Command<QueryUserData, QueryUserRawData, QueryUserResponse> {
  final Realm realm;

  QueryAppUserCommand(this.realm)
      : super(queryAppUserCommandId, queryAppUserCommandName);

  @override
  Future<QueryUserResponse> handleEvent(QueryUserData eventData) async{
   return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<QueryUserResponse> handleRawEvent(QueryUserRawData eventData) async{
    final user = realm.query<AppUser>("username == '${eventData.username}'").first;
    final response = QueryUserResponse(user: user,messageId: eventData.messageId);

    return response;
  }
}

class QueryUserData extends ServiceEventData<QueryUserRawData> {
  final String username;
  final String password;

  QueryUserData({
    required this.username,
    required this.password,
    required String requesterId,
  }) : super(requesterId);

  @override
  QueryUserRawData toRawServiceEventData() {
   return QueryUserRawData(
      username: username,
      password: password,
      messageId: messageId,
      requesterId: requesterId,
      eventId: queryAppUserCommandId,
    );
  }
}

class QueryUserRawData extends RawServiceEventData {
   final String username;
  final String password;

  QueryUserRawData( {
       required this.username,
    required this.password,
    required int messageId,
    required String requesterId,
    required int eventId,
  }) : super(messageId, requesterId, eventId);
}

class QueryUserResponse extends ServiceEventResponse {
  AppUser? user;

  QueryUserResponse({
    this.user,
    required int messageId,
    ServiceEventResponseStatus responseType =
        ServiceEventResponseStatus.success,
  }) : super(messageId, responseType);
}
