import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

import 'models.dart';

final int allSessionsEventId = Apis.allSessions.index;
final String allSessionsEventName = Apis.allSessions.name;

class AllSessionsBilansCommand extends Command<AllSessionsBilansEventData,
    AllSessionsBilansRawEventData, AllSessionsBilansResponse> {
  final Map<String, String> _headers;

  AllSessionsBilansCommand([this._headers = const {}])
      : super(allSessionsEventId, allSessionsEventName);

  @override
  Future<AllSessionsBilansResponse> handleEvent(
      AllSessionsBilansEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<AllSessionsBilansResponse> handleRawEvent(
      AllSessionsBilansRawEventData eventData) {
    Api api = AllSessionsApi();

    String apiUrl =
        api.url.replaceAll(formationOffreToken, eventData.formationId);
    apiUrl = apiUrl.replaceAll(studyLevelToken, eventData.studyLevel);

    Uri url = Uri.https(host, apiUrl);

    _headers.putIfAbsent("authorization", () => eventData.authKey);

    return ApiService.instance()
        .client
        .get(url, headers: _headers)
        .then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<SessionBilan> allSessionsBilans = [];

        for (Map<String, dynamic> sessionBilan in decodedResponse) {
          if (sessionBilan[SessionBilanKey.annuel.name] == false) {
            allSessionsBilans.add(SessionBilan.fromJson(sessionBilan));
          }
        }

        return AllSessionsBilansResponse(
            messageId: eventData.messageId,
            allSessionsBilans: allSessionsBilans);
      } catch (e) {
        return AllSessionsBilansResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class AllSessionsBilansEventData
    extends ServiceEventData<AllSessionsBilansRawEventData> {
  final String studyLevel;
  final String formationId;

  final String authKey;
  AllSessionsBilansEventData({
    required this.formationId,
    required this.studyLevel,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  AllSessionsBilansRawEventData toRawServiceEventData() {
    return AllSessionsBilansRawEventData(
        formationId: formationId,
        authKey: authKey,
        studyLevel: studyLevel,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class AllSessionsBilansRawEventData extends RawServiceEventData {
  final String studyLevel;
  final String formationId;

  final String authKey;

  AllSessionsBilansRawEventData(
      {required this.studyLevel,
      required this.formationId,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.allSessions.index);
}

class AllSessionsBilansResponse extends ServiceEventResponse {
  final List<SessionBilan>? allSessionsBilans;

  AllSessionsBilansResponse({
    this.allSessionsBilans,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

class AllSessionsBilanEvent extends ServiceEvent<AllSessionsBilansResponse> {
  AllSessionsBilanEvent({required super.eventData, super.callback})
      : super(allSessionsEventId, allSessionsEventName, serviceId);
}
