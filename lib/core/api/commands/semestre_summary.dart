import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

class SemestreSummaryCommand extends Command<SemestreSummaryEventData,
    SemestreSummaryRawEventData, SemestreSummaryResponse> {
  static final int id = Apis.currentAcademiqueYearCycles.index;
  static final String name = Apis.currentAcademiqueYearCycles.name;

  SemestreSummaryCommand() : super(id, name);

  @override
  Future<SemestreSummaryResponse> handleEvent(
      SemestreSummaryEventData eventData) {
    int messageId = eventData.messageId;
    return handleRawEvent(eventData.toRawServiceEventData(messageId));
  }

  @override
  Future<SemestreSummaryResponse> handleRawEvent(
      SemestreSummaryRawEventData eventData) {
    Api api = AcademiqueYearCyclesApi();

       String apiUrl = api.url.replaceAll(studyLevelToken, eventData.studyLevel);


    Uri url = Uri.https(host, apiUrl);

    final headers = {"authorization": eventData.authKey};

    return ApiService.instance()
        .client
        .get(url, headers: headers)
        .then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
         List<SemetreSummary> semestres = decodedResponse
            .map((e) => SemetreSummary.fromJson(e as Map<String, dynamic>))
            .toList();
        return SemestreSummaryResponse(
                messageId: eventData.messageId, semestreSummary: semestres);
      } catch (e) {
        return SemestreSummaryResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class SemestreSummaryEventData
    extends ServiceEventData<SemestreSummaryRawEventData> {
  final int messageId;
  final String studyLevel;


  final String authKey;
  SemestreSummaryEventData({
    required this.studyLevel,
    required this.authKey,
    required this.messageId,
    required String requesterId,
  }) : super(requesterId);

  @override
  SemestreSummaryRawEventData toRawServiceEventData(int messageId) {
    return SemestreSummaryRawEventData(
        authKey: authKey,
        studyLevel: studyLevel,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class SemestreSummaryRawEventData extends RawServiceEventData {
  final String studyLevel;


  final String authKey;

  SemestreSummaryRawEventData(
      {required this.studyLevel,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.currentAcademiqueYearCycles.index);
}

class SemestreSummaryResponse extends ServiceEventResponse {
  final List<SemetreSummary>? semestreSummary;

  SemestreSummaryResponse({
    this.semestreSummary,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum SemetreSummaryKey {
  code,
  credit,
  id,
  libelleCourtAr,
  libelleCourtLt,
  libelleLongAr,
  libelleLongFrCycle,
  libelleLongFrNiveau,
  libelleLongLt,
  ncPeriodeCode,
  ncPeriodeId,
  ncPeriodeLibelle,
  rang,
  rangNiveau,
  refCodePeriode,
  refCodePeriodicite,
}

class SemetreSummary {
  final String code;
  final int credit;
  final int id;
  final String libelleCourtAr;
  final String libelleCourtLt;
  final String libelleLongAr;
  final String libelleLongFrCycle;
  final String libelleLongFrNiveau;
  final String libelleLongLt;
  final String ncPeriodeCode;
  final String ncPeriodeId;
  final String ncPeriodeLibelle;
  final int rang;
  final int rangNiveau;
  final String refCodePeriode;
  final String refCodePeriodicite;

  SemetreSummary({
    required this.code,
    required this.credit,
    required this.id,
    required this.libelleCourtAr,
    required this.libelleCourtLt,
    required this.libelleLongAr,
    required this.libelleLongFrCycle,
    required this.libelleLongFrNiveau,
    required this.libelleLongLt,
    required this.ncPeriodeCode,
    required this.ncPeriodeId,
    required this.ncPeriodeLibelle,
    required this.rang,
    required this.rangNiveau,
    required this.refCodePeriode,
    required this.refCodePeriodicite,
  });

  factory SemetreSummary.fromJson(Map<String, dynamic> json) {
    return SemetreSummary(
      code: json[SemetreSummaryKey.code.name],
      credit: json[SemetreSummaryKey.credit.name],
      id: json[SemetreSummaryKey.id.name],
      libelleCourtAr: json[SemetreSummaryKey.libelleCourtAr.name],
      libelleCourtLt: json[SemetreSummaryKey.libelleCourtLt.name],
      libelleLongAr: json[SemetreSummaryKey.libelleLongAr.name],
      libelleLongFrCycle: json[SemetreSummaryKey.libelleLongFrCycle.name],
      libelleLongFrNiveau: json[SemetreSummaryKey.libelleLongFrNiveau.name],
      libelleLongLt: json[SemetreSummaryKey.libelleLongLt.name],
      ncPeriodeCode: json[SemetreSummaryKey.ncPeriodeCode.name],
      ncPeriodeId: json[SemetreSummaryKey.ncPeriodeId.name],
      ncPeriodeLibelle: json[SemetreSummaryKey.ncPeriodeLibelle.name],
      rang: json[SemetreSummaryKey.rang.name],
      rangNiveau: json[SemetreSummaryKey.rangNiveau.name],
      refCodePeriode: json[SemetreSummaryKey.refCodePeriode.name],
      refCodePeriodicite: json[SemetreSummaryKey.refCodePeriodicite.name],
    );
  }
}