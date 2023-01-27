import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

class ExamSessionsCommand extends Command<ExamSessionsEventData,
    ExamSessionsRawEventData, ExamSessionsResponse> {
  static final int id = Apis.examsResults.index;
  static final String name = Apis.examsResults.name;

  ExamSessionsCommand() : super(id, name);

  @override
  Future<ExamSessionsResponse> handleEvent(ExamSessionsEventData eventData) {
    int messageId = eventData.messageId;
    return handleRawEvent(eventData.toRawServiceEventData(messageId));
  }

  @override
  Future<ExamSessionsResponse> handleRawEvent(
      ExamSessionsRawEventData eventData) {
    Api api = ExamsSessionApi();

    String apiUrl =
        api.url.replaceAll(formationOffreToken, eventData.formationId);
    apiUrl = apiUrl.replaceAll(studyLevelToken, eventData.studyLevel);

    Uri url = Uri.https(host, apiUrl);

    final headers = {"authorization": eventData.authKey};

    return ApiService.instance()
        .client
        .get(url, headers: headers)
        .then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<ExamSession> examSessions = decodedResponse
            .map((e) => ExamSession.fromJson(e as Map<String, dynamic>))
            .toList();

        return ExamSessionsResponse(
            messageId: eventData.messageId, examSessions: examSessions);
      } catch (e) {
        return ExamSessionsResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class ExamSessionsEventData extends ServiceEventData<ExamSessionsRawEventData> {
  final int messageId;
  final String studyLevel;
  final String formationId;

  final String authKey;
  ExamSessionsEventData({
    required this.formationId,
    required this.studyLevel,
    required this.authKey,
    required this.messageId,
    required String requesterId,
  }) : super(requesterId);

  @override
  ExamSessionsRawEventData toRawServiceEventData(int messageId) {
    return ExamSessionsRawEventData(
        formationId: formationId,
        authKey: authKey,
        studyLevel: studyLevel,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class ExamSessionsRawEventData extends RawServiceEventData {
  final String studyLevel;
  final String formationId;

  final String authKey;

  ExamSessionsRawEventData(
      {required this.studyLevel,
      required this.formationId,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.examsResults.index);
}

class ExamSessionsResponse extends ServiceEventResponse {
  final List<ExamSession>? examSessions;

  ExamSessionsResponse({
    this.examSessions,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum ExamSessionKey {
  anneeAcademiqueCode,
  anneeAcademiqueId,
  avecControle,
  avecControleContinu,
  avecControleIntermediaire,
  codePeriode,
  coefficient,
  coefficientNoteEliminatoire,
  cycleCode,
  cycleId,
  cycleLibelleLongLt,
  dateCloture,
  dateCreation,
  dateDebut,
  dateFin,
  datePublication,
  estMigree,
  examenSessionDtos,
  id,
  idPeriode,
  intitule,
  libellePeriode,
  ncTypeSessionCode,
  ncTypeSessionId,
  ncTypeSessionLibelleFr,
  niveauCode,
  niveauId,
  niveauLibelleLongLt,
  nombreNote,
  notesValide,
  numeroSession,
  offreFormationCode,
  offreFormationId,
  offreFormationLibelleAr,
  offreFormationLibelleFr,
  ouvertureOffreFormationId,
  refCodeEtablissement,
  sessionARemplacerId,
  sessionARemplacerIntitule,
  situationCode,
  situationId,
  situationLibelleAr,
  situationLibelleFr,
}

class ExamSession {
  final String anneeAcademiqueCode;
  final int anneeAcademiqueId;
  final bool avecControle;
  final bool avecControleContinu;
  final bool avecControleIntermediaire;
  final String codePeriode;
  final double coefficient;
  final double coefficientNoteEliminatoire;
  final String cycleCode;
  final int cycleId;
  final String cycleLibelleLongLt;
  final String dateCloture;
  final String dateCreation;
  final String dateDebut;
  final String dateFin;
  final String datePublication;
  final bool estMigree;
  final List<ExamSession> examenSessionDtos;
  final int id;
  final int idPeriode;
  final String intitule;
  final String libellePeriode;
  final String ncTypeSessionCode;
  final int ncTypeSessionId;
  final String ncTypeSessionLibelleFr;
  final String niveauCode;
  final int niveauId;
  final String niveauLibelleLongLt;
  final int nombreNote;
  final bool notesValide;
  final int numeroSession;
  final String offreFormationCode;
  final int offreFormationId;
  final String offreFormationLibelleAr;
  final String offreFormationLibelleFr;
  final int ouvertureOffreFormationId;
  final String refCodeEtablissement;
  final int sessionARemplacerId;
  final String sessionARemplacerIntitule;
  final String situationCode;
  final int situationId;
  final String situationLibelleAr;
  final String situationLibelleFr;

  ExamSession({
    required this.anneeAcademiqueCode,
    required this.anneeAcademiqueId,
    required this.avecControle,
    required this.avecControleContinu,
    required this.avecControleIntermediaire,
    required this.codePeriode,
    required this.coefficient,
    required this.coefficientNoteEliminatoire,
    required this.cycleCode,
    required this.cycleId,
    required this.cycleLibelleLongLt,
    required this.dateCloture,
    required this.dateCreation,
    required this.dateDebut,
    required this.dateFin,
    required this.datePublication,
    required this.estMigree,
    required this.examenSessionDtos,
    required this.id,
    required this.idPeriode,
    required this.intitule,
    required this.libellePeriode,
    required this.ncTypeSessionCode,
    required this.ncTypeSessionId,
    required this.ncTypeSessionLibelleFr,
    required this.niveauCode,
    required this.niveauId,
    required this.niveauLibelleLongLt,
    required this.nombreNote,
    required this.notesValide,
    required this.numeroSession,
    required this.offreFormationCode,
    required this.offreFormationId,
    required this.offreFormationLibelleAr,
    required this.offreFormationLibelleFr,
    required this.ouvertureOffreFormationId,
    required this.refCodeEtablissement,
    required this.sessionARemplacerId,
    required this.sessionARemplacerIntitule,
    required this.situationCode,
    required this.situationId,
    required this.situationLibelleAr,
    required this.situationLibelleFr,
  });

  factory ExamSession.fromJson(Map<String, dynamic> json) {
    return ExamSession(
      anneeAcademiqueCode: json[ExamSessionKey.anneeAcademiqueCode.name],
      anneeAcademiqueId: json[ExamSessionKey.anneeAcademiqueId.name],
      avecControle: json[ExamSessionKey.avecControle.name],
      avecControleContinu: json[ExamSessionKey.avecControleContinu.name],
      avecControleIntermediaire:
          json[ExamSessionKey.avecControleIntermediaire.name],
      codePeriode: json[ExamSessionKey.codePeriode.name],
      coefficient: json[ExamSessionKey.coefficient.name],
      coefficientNoteEliminatoire:
          json[ExamSessionKey.coefficientNoteEliminatoire.name],
      cycleCode: json[ExamSessionKey.cycleCode.name],
      cycleId: json[ExamSessionKey.cycleId.name],
      cycleLibelleLongLt: json[ExamSessionKey.cycleLibelleLongLt.name],
      dateCloture: json[ExamSessionKey.dateCloture.name],
      dateCreation: json[ExamSessionKey.dateCreation.name],
      dateDebut: json[ExamSessionKey.dateDebut.name],
      dateFin: json[ExamSessionKey.dateFin.name],
      datePublication: json[ExamSessionKey.datePublication.name],
      estMigree: json[ExamSessionKey.estMigree.name],
      examenSessionDtos: json[ExamSessionKey.examenSessionDtos.name],
      id: json[ExamSessionKey.id.name],
      idPeriode: json[ExamSessionKey.idPeriode.name],
      intitule: json[ExamSessionKey.intitule.name],
      libellePeriode: json[ExamSessionKey.libellePeriode.name],
      ncTypeSessionCode: json[ExamSessionKey.ncTypeSessionCode.name],
      ncTypeSessionId: json[ExamSessionKey.ncTypeSessionId.name],
      ncTypeSessionLibelleFr: json[ExamSessionKey.ncTypeSessionLibelleFr.name],
      niveauCode: json[ExamSessionKey.niveauCode.name],
      niveauId: json[ExamSessionKey.niveauId.name],
      niveauLibelleLongLt: json[ExamSessionKey.niveauLibelleLongLt.name],
      nombreNote: json[ExamSessionKey.nombreNote.name],
      notesValide: json[ExamSessionKey.notesValide.name],
      numeroSession: json[ExamSessionKey.numeroSession.name],
      offreFormationCode: json[ExamSessionKey.offreFormationCode.name],
      offreFormationId: json[ExamSessionKey.offreFormationId.name],
      offreFormationLibelleAr:
          json[ExamSessionKey.offreFormationLibelleAr.name],
      offreFormationLibelleFr:
          json[ExamSessionKey.offreFormationLibelleFr.name],
      ouvertureOffreFormationId:
          json[ExamSessionKey.ouvertureOffreFormationId.name],
      refCodeEtablissement: json[ExamSessionKey.refCodeEtablissement.name],
      sessionARemplacerId: json[ExamSessionKey.sessionARemplacerId.name],
      sessionARemplacerIntitule:
          json[ExamSessionKey.sessionARemplacerIntitule.name],
      situationCode: json[ExamSessionKey.situationCode.name],
      situationId: json[ExamSessionKey.situationId.name],
      situationLibelleAr: json[ExamSessionKey.situationLibelleAr.name],
      situationLibelleFr: json[ExamSessionKey.situationLibelleFr.name],
    );
  }
}
