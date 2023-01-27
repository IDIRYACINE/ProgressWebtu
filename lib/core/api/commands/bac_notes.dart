

import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

class BacSummaryCommand extends Command<BacNotesEventData,
    BacNotesRawEventData, BacNotesResponse> {
  static final int id = Apis.bacResults.index;
  static final String name = Apis.bacResults.name;

  BacSummaryCommand() : super(id, name);

  @override
  Future<BacNotesResponse> handleEvent(BacNotesEventData eventData) {
    int messageId = eventData.messageId;
    return handleRawEvent(eventData.toRawServiceEventData(messageId));
  }

  @override
  Future<BacNotesResponse> handleRawEvent(BacNotesRawEventData eventData) {
    Api api = BacNotesApi();

    String apiUrl = api.url.replaceAll(usernameToken, eventData.username);
    apiUrl = apiUrl.replaceAll(bacYearToken, eventData.bacYear);

    Uri url = Uri.https(host, apiUrl);

    final headers = {"authorization": eventData.authKey};
   
    return  ApiService.instance().client.get(url, headers: headers).then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<BacNote> bacNotes = decodedResponse
            .map((e) => BacNote.fromJson(e as Map<String, dynamic>))
            .toList();
        BacNotesResponse bacNotesResponse = BacNotesResponse(messageId: eventData.messageId, bacNotes: bacNotes);
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
  final int messageId;
  final String username;

  final String bacYear;

  final String authKey;
  BacNotesEventData({
    required this.username,
    required this.bacYear,
    required this.authKey,
    required this.messageId,
    required String requesterId,
  }) : super(requesterId);

  @override
  BacNotesRawEventData toRawServiceEventData(int messageId) {
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
