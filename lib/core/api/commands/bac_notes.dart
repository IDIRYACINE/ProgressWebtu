import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int bacNotesEventId = Apis.bacResults.index;
final String bacNotesEventName = Apis.bacResults.name;

class BacSummaryCommand
    extends Command<BacNotesEventData, BacNotesRawEventData, BacNotesResponse> {
  BacSummaryCommand() : super(bacNotesEventId, bacNotesEventName);

  @override
  Future<BacNotesResponse> handleEvent(BacNotesEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<BacNotesResponse> handleRawEvent(BacNotesRawEventData eventData) {
    Api api = BacNotesApi();

    String apiUrl = api.url.replaceAll(usernameToken, eventData.username);
    apiUrl = apiUrl.replaceAll(bacYearToken, eventData.bacYear);

    Uri url = Uri.https(host, apiUrl);

    final headers = {"authorization": eventData.authKey};

    return ApiService.instance()
        .client
        .get(url, headers: headers)
        .then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<BacNote> bacNotes = decodedResponse
            .map((e) => BacNote.fromJson(e as Map<String, dynamic>))
            .toList();
        BacNotesResponse bacNotesResponse = BacNotesResponse(
            messageId: eventData.messageId, bacNotes: bacNotes);
        return bacNotesResponse;
      } catch (e) {
        return BacNotesResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class BacNotesEventData extends ServiceEventData<BacNotesRawEventData> {
  final String username;

  final String bacYear;

  final String authKey;
  BacNotesEventData({
    required this.username,
    required this.bacYear,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  BacNotesRawEventData toRawServiceEventData() {
    return BacNotesRawEventData(
        authKey: authKey,
        bacYear: bacYear,
        username: username,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class BacNotesRawEventData extends RawServiceEventData {
  final String username;

  final String bacYear;

  final String authKey;

  BacNotesRawEventData(
      {required this.username,
      required this.bacYear,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.bacResults.index);
}

class BacNotesResponse extends ServiceEventResponse {
  final List<BacNote>? bacNotes;

  BacNotesResponse({
    this.bacNotes,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum BacNoteKey {
  note,
  refCodeMatiere,
}

class BacNote {
  final double note;
  final String refCodeMatiere;

  BacNote({
    required this.note,
    required this.refCodeMatiere,
  });

  factory BacNote.fromJson(Map<String, dynamic> json) {
    return BacNote(
      note: json[BacNoteKey.note.name],
      refCodeMatiere: json[BacNoteKey.refCodeMatiere.name],
    );
  }
}

class BacNotesEvent extends ServiceEvent<BacNotesResponse>{
  BacNotesEvent({required super.eventData,super.callback}) : super(bacNotesEventId, bacNotesEventName, serviceId);
}
