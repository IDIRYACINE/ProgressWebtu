
import 'package:progresswebtu/core/database/models/user.dart';
import 'package:progresswebtu/core/database/types.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';
import 'package:realm/realm.dart';

final updateAppUserCommandId = DatbaseCommands.updateAppUser.index;
final updateAppUserCommandName = DatbaseCommands.updateAppUser.name;

class UpdateAppUserCommand
    extends Command<UpdateUserData, UpdateUserRawData, UpdateUserResponse> {
  final Realm realm;

  UpdateAppUserCommand(this.realm)
      : super(updateAppUserCommandId, updateAppUserCommandName);

  @override
  Future<UpdateUserResponse> handleEvent(UpdateUserData eventData) async {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<UpdateUserResponse> handleRawEvent(UpdateUserRawData eventData) async {
    final queryResult =
        realm.query<AppUser>("username == '${eventData.newUser.username}'");

    if (queryResult.isEmpty) {
      realm.write(() {
        realm.add(eventData.newUser);
      });
    } else {
      final user = queryResult.first;
      realm.write(() {
        user.password = eventData.newUser.password;
        user.username = eventData.newUser.username;
        user.authKey = eventData.newUser.authKey;
        user.authKeyExpiration = eventData.newUser.authKeyExpiration;
      });
    }

    return UpdateUserResponse(messageId: eventData.messageId);
  }
}

class UpdateUserData extends ServiceEventData<UpdateUserRawData> {
   final AppUser newUser;


  UpdateUserData({
    required this.newUser,

    required String requesterId,
  }) : super(requesterId);

  @override
  UpdateUserRawData toRawServiceEventData() {
    return UpdateUserRawData(
        newUser:newUser,

      messageId: messageId,
      requesterId: requesterId,
      eventId: updateAppUserCommandId,
    );
  }
}

class UpdateUserRawData extends RawServiceEventData {
  final AppUser newUser;

  UpdateUserRawData({
    required this.newUser,
    required int messageId,
    required String requesterId,
    required int eventId,
  }) : super(messageId, requesterId, eventId);
}

class UpdateUserResponse extends ServiceEventResponse {
  AppUser? user;

  UpdateUserResponse({
    this.user,
    required int messageId,
    ServiceEventResponseStatus responseType =
        ServiceEventResponseStatus.success,
  }) : super(messageId, responseType);
}
