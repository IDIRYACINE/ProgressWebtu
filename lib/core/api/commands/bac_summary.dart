import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int bacSummaryEventId = Apis.profile.index;
final String bacSummaryEventName = Apis.profile.name;

class BacSummaryCommand extends Command<BacSummaryEventData,
    BacSummaryRawEventData, BacSummaryResponse> {
  final Map<String, String> _headers;

  BacSummaryCommand([this._headers = const {}])
      : super(bacSummaryEventId, bacSummaryEventName);

  @override
  Future<BacSummaryResponse> handleEvent(BacSummaryEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<BacSummaryResponse> handleRawEvent(BacSummaryRawEventData eventData) {
    Api api = BacSummaryApi();

    String apiUrl = api.url.replaceAll(usernameToken, eventData.username);
    apiUrl = apiUrl.replaceAll(bacYearToken, eventData.bacYear);

    Uri url = Uri.https(host, apiUrl);

    _headers.putIfAbsent("authorization", () => eventData.authKey);

    return ApiService.instance()
        .client
        .get(url, headers: _headers)
        .then((response) {
      try {

        final decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        BacSummary bacSummary = BacSummary.fromJson(decodedResponse);
        BacSummaryResponse bacSummaryResponse = BacSummaryResponse(
            bacSummary: bacSummary, messageId: eventData.messageId);
        return bacSummaryResponse;
      } catch (e) {
        return BacSummaryResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class BacSummaryEventData extends ServiceEventData<BacSummaryRawEventData> {
  final String username;

  final String bacYear;

  final String authKey;
  BacSummaryEventData({
    required this.username,
    required this.bacYear,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  BacSummaryRawEventData toRawServiceEventData() {
    return BacSummaryRawEventData(
        authKey: authKey,
        bacYear: bacYear,
        username: username,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class BacSummaryRawEventData extends RawServiceEventData {
  final String username;

  final String bacYear;

  final String authKey;

  BacSummaryRawEventData(
      {required this.username,
      required this.bacYear,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.profile.index);
}

class BacSummaryResponse extends ServiceEventResponse {
  final BacSummary? bacSummary;

  BacSummaryResponse({
    this.bacSummary,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum BacSummaryKeys {
  anneeBac,
  dateNaissance,
  id,
  libelleSerieBac,
  matricule,
  moyenneBac,
  moyenneGeneraleBac,
  nin,
  nomAr,
  nomFr,
  prenomAr,
  prenomFr,
  refCodeSerieBac,
  refCodeWilayaBac,
}

class BacSummary {
  final String anneeBac;
  final String dateNaissance;
  final int id;
  final String libelleSerieBac;
  final String matricule;
  final String moyenneBac;
  final double moyenneGeneraleBac;
  final String nin;
  final String nomAr;
  final String nomFr;
  final String prenomAr;
  final String prenomFr;
  final String refCodeSerieBac;
  final String refCodeWilayaBac;

  BacSummary({
    required this.anneeBac,
    required this.dateNaissance,
    required this.id,
    required this.libelleSerieBac,
    required this.matricule,
    required this.moyenneBac,
    required this.moyenneGeneraleBac,
    required this.nin,
    required this.nomAr,
    required this.nomFr,
    required this.prenomAr,
    required this.prenomFr,
    required this.refCodeSerieBac,
    required this.refCodeWilayaBac,
  });

  factory BacSummary.fromJson(Map<String, dynamic> json) {
    final anneeBac = json[BacSummaryKeys.anneeBac.name] as String;
    final dateNaissance = json[BacSummaryKeys.dateNaissance.name] as String;
    final id = json[BacSummaryKeys.id.name] as int;
    final libelleSerieBac = json[BacSummaryKeys.libelleSerieBac.name] as String;
    final matricule = json[BacSummaryKeys.matricule.name] as String;
    final moyenneBac = json[BacSummaryKeys.moyenneBac.name] as String;
    final moyenneGeneraleBac =
        json[BacSummaryKeys.moyenneGeneraleBac.name] as double;
    final nin = json[BacSummaryKeys.nin.name] as String;
    final nomAr = json[BacSummaryKeys.nomAr.name] as String;
    final nomFr = json[BacSummaryKeys.nomFr.name] as String;
    final prenomAr = json[BacSummaryKeys.prenomAr.name] as String;
    final prenomFr = json[BacSummaryKeys.prenomFr.name] as String;
    final refCodeSerieBac = json[BacSummaryKeys.refCodeSerieBac.name] as String;
    final refCodeWilayaBac =
        json[BacSummaryKeys.refCodeWilayaBac.name] as String;

    return BacSummary(
      anneeBac: anneeBac,
      dateNaissance: dateNaissance,
      id: id,
      libelleSerieBac: libelleSerieBac,
      matricule: matricule,
      moyenneBac: moyenneBac,
      moyenneGeneraleBac: moyenneGeneraleBac,
      nin: nin,
      nomAr: nomAr,
      nomFr: nomFr,
      prenomAr: prenomAr,
      prenomFr: prenomFr,
      refCodeSerieBac: refCodeSerieBac,
      refCodeWilayaBac: refCodeWilayaBac,
    );
  }
}

class BacSummaryEvent extends ServiceEvent<BacSummaryResponse> {
  BacSummaryEvent({required super.eventData, super.callback})
      : super(bacSummaryEventId, bacSummaryEventName, serviceId);
}
