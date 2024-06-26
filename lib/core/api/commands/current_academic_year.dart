import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int currentAcademicYearEventId = Apis.currentAcademiqueYear.index;
final String currentAcademicYearEventName = Apis.currentAcademiqueYear.name;

class CurrentAcademicYearCommand extends Command<CurrentAcademicYearEventData,
    CurrentAcademicYearRawEventData, CurrentAcademicYearResponse> {
  final Map<String, String> _headers;

  CurrentAcademicYearCommand([this._headers = const {}])
      : super(currentAcademicYearEventId, currentAcademicYearEventName);

  @override
  Future<CurrentAcademicYearResponse> handleEvent(
      CurrentAcademicYearEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<CurrentAcademicYearResponse> handleRawEvent(
      CurrentAcademicYearRawEventData eventData) {
    Api api = CurrentAcademicYearApi();

    String apiUrl = api.url.replaceAll(usernameToken, eventData.username);
    apiUrl = apiUrl.replaceAll(bacYearToken, eventData.bacYear);
    apiUrl = apiUrl.replaceAll(academicYearIdToken, eventData.academicYearId);

    Uri url = Uri.https(host, apiUrl);

    _headers.putIfAbsent("Authorization", () => eventData.authKey);

    return ApiService.instance()
        .client
        .get(url, headers: _headers)
        .then((response) {
      try {
        final decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;

        CurrentAcademiqueYear academicYear =
            CurrentAcademiqueYear.fromJson(decodedResponse);

        CurrentAcademicYearResponse currentAcademicYearResponse =
            CurrentAcademicYearResponse(
                messageId: eventData.messageId,
                currentAcademicYear: academicYear);
        return currentAcademicYearResponse;
      } catch (e) {
        return CurrentAcademicYearResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class CurrentAcademicYearEventData
    extends ServiceEventData<CurrentAcademicYearRawEventData> {
  final String username;
  final String academicYearId;

  final String bacYear;

  final String authKey;
  CurrentAcademicYearEventData({
    required this.academicYearId,
    required this.username,
    required this.bacYear,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  CurrentAcademicYearRawEventData toRawServiceEventData() {
    return CurrentAcademicYearRawEventData(
        authKey: authKey,
        bacYear: bacYear,
        username: username,
        messageId: messageId,
        requesterId: requesterId,
        academicYearId: academicYearId);
  }
}

class CurrentAcademicYearRawEventData extends RawServiceEventData {
  final String username;

  final String bacYear;

  final String academicYearId;

  final String authKey;

  CurrentAcademicYearRawEventData(
      {required this.username,
      required this.academicYearId,
      required this.bacYear,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.currentAcademiqueYear.index);
}

class CurrentAcademicYearResponse extends ServiceEventResponse {
  final CurrentAcademiqueYear? currentAcademicYear;

  CurrentAcademicYearResponse({
    this.currentAcademicYear,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum CurrentAcademiqueYearKey {
  code,
  dateDebut,
  dateFin,
  deuxiemeAnnee,
  id,
  libelle,
  premiereAnnee,
  semaineDebut,
  semaineFin,
  valid,
}

class CurrentAcademiqueYear {
  final String code;
  final DateTime? dateDebut;
  final DateTime? dateFin;
  final int deuxiemeAnnee;
  final int id;
  final String libelle;
  final int premiereAnnee;
  final int semaineDebut;
  final int semaineFin;
  final bool valid;

  CurrentAcademiqueYear({
    required this.code,
    required this.dateDebut,
    required this.dateFin,
    required this.deuxiemeAnnee,
    required this.id,
    required this.libelle,
    required this.premiereAnnee,
    required this.semaineDebut,
    required this.semaineFin,
    required this.valid,
  });

  factory CurrentAcademiqueYear.fromJson(Map<String, dynamic> json) {
    return CurrentAcademiqueYear(
        code: json[CurrentAcademiqueYearKey.code.name],
        dateDebut: json[CurrentAcademiqueYearKey.dateDebut.name] != null
            ? DateTime.parse(json[CurrentAcademiqueYearKey.dateDebut.name])
            : null,
        dateFin: json[CurrentAcademiqueYearKey.dateFin.name] != null
            ? DateTime.parse(json[CurrentAcademiqueYearKey.dateFin.name])
            : null,
        deuxiemeAnnee: json[CurrentAcademiqueYearKey.deuxiemeAnnee.name],
        id: json[CurrentAcademiqueYearKey.id.name],
        libelle: json[CurrentAcademiqueYearKey.libelle.name],
        premiereAnnee: json[CurrentAcademiqueYearKey.premiereAnnee.name],
        semaineDebut: json[CurrentAcademiqueYearKey.semaineDebut.name],
        semaineFin: json[CurrentAcademiqueYearKey.semaineFin.name],
        valid: json[CurrentAcademiqueYearKey.valid.name]);
  }
}

class CurrentAcademicYearEvent
    extends ServiceEvent<CurrentAcademicYearResponse> {
  CurrentAcademicYearEvent({required super.eventData, super.callback})
      : super(currentAcademicYearEventId, currentAcademicYearEventName, serviceId);
}
