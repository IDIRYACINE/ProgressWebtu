import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int examNotesEventId = Apis.examsResults.index;
final String examNotesEventName = Apis.examsResults.name;

class ExamNotesCommand extends Command<ExamNotesEventData,
    ExamNotesRawEventData, ExamNotesResponse> {
  ExamNotesCommand() : super(examNotesEventId, examNotesEventName);

  @override
  Future<ExamNotesResponse> handleEvent(ExamNotesEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<ExamNotesResponse> handleRawEvent(ExamNotesRawEventData eventData) {
    Api api = ExamsNotesApi();

    String apiUrl = api.url.replaceAll(studentIdToken, eventData.studentId);

    Uri url = Uri.https(host, apiUrl);

    final headers = {"authorization": eventData.authKey};

    return ApiService.instance()
        .client
        .get(url, headers: headers)
        .then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<ExamNote> examNotes = decodedResponse
            .map((e) => ExamNote.fromJson(e as Map<String, dynamic>))
            .toList();

        return ExamNotesResponse(
            messageId: eventData.messageId, examNotes: examNotes);
      } catch (e) {
        return ExamNotesResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class ExamNotesEventData extends ServiceEventData<ExamNotesRawEventData> {
  final String studyLevel;

  final String authKey;
  ExamNotesEventData({
    required this.studyLevel,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  ExamNotesRawEventData toRawServiceEventData( ) {
    return ExamNotesRawEventData(
        authKey: authKey,
        studentId: studyLevel,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class ExamNotesRawEventData extends RawServiceEventData {
  final String studentId;

  final String authKey;

  ExamNotesRawEventData(
      {required this.studentId,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.examsResults.index);
}

class ExamNotesResponse extends ServiceEventResponse {
  final List<ExamNote>? examNotes;

  ExamNotesResponse({
    this.examNotes,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum ExamNoteKey {
  absenceJustifie,
  absent,
  avecControleContinu,
  conge,
  copieNonRemise,
  etudiantRachete,
  exclu,
  id,
  idPeriode,
  mcLibelleFr,
  modifiableByJury,
  moyenneGenerale,
  noteEliminatoire,
  noteObtenu,
  oldAbsenceJustifie,
  oldAbsent,
  oldCopieNonRemise,
  planningSessionId,
  planningSessionIntitule,
  rattachementMcCoefficient,
  rattachementMcCredit,
  rattachementMcId,
  readerByJury,
  subscribed,
  totalCoefficient,
  ueCode,
  ueNatureLlFr,
}

class ExamNote {
  final bool absenceJustifie;
  final bool absent;
  final bool avecControleContinu;
  final bool conge;
  final bool copieNonRemise;
  final bool etudiantRachete;
  final bool exclu;
  final int id;
  final int idPeriode;
  final String mcLibelleFr;
  final bool modifiableByJury;
  final double moyenneGenerale;
  final double noteEliminatoire;
  final bool noteObtenu;
  final bool oldAbsenceJustifie;
  final bool oldAbsent;
  final bool oldCopieNonRemise;
  final int planningSessionId;
  final String planningSessionIntitule;
  final double rattachementMcCoefficient;
  final double rattachementMcCredit;
  final int rattachementMcId;
  final bool readerByJury;
  final bool subscribed;
  final double totalCoefficient;
  final String ueCode;
  final String ueNatureLlFr;

  ExamNote({
    required this.absenceJustifie,
    required this.absent,
    required this.avecControleContinu,
    required this.conge,
    required this.copieNonRemise,
    required this.etudiantRachete,
    required this.exclu,
    required this.id,
    required this.idPeriode,
    required this.mcLibelleFr,
    required this.modifiableByJury,
    required this.moyenneGenerale,
    required this.noteEliminatoire,
    required this.noteObtenu,
    required this.oldAbsenceJustifie,
    required this.oldAbsent,
    required this.oldCopieNonRemise,
    required this.planningSessionId,
    required this.planningSessionIntitule,
    required this.rattachementMcCoefficient,
    required this.rattachementMcCredit,
    required this.rattachementMcId,
    required this.readerByJury,
    required this.subscribed,
    required this.totalCoefficient,
    required this.ueCode,
    required this.ueNatureLlFr,
  });

  factory ExamNote.fromJson(Map<String, dynamic> json) {
    return ExamNote(
      absenceJustifie: json[ExamNoteKey.absenceJustifie.name],
      absent: json[ExamNoteKey.absent.name],
      avecControleContinu: json[ExamNoteKey.avecControleContinu.name],
      conge: json[ExamNoteKey.conge.name],
      copieNonRemise: json[ExamNoteKey.copieNonRemise.name],
      etudiantRachete: json[ExamNoteKey.etudiantRachete.name],
      exclu: json[ExamNoteKey.exclu.name],
      id: json[ExamNoteKey.id.name],
      idPeriode: json[ExamNoteKey.idPeriode.name],
      mcLibelleFr: json[ExamNoteKey.mcLibelleFr.name],
      modifiableByJury: json[ExamNoteKey.modifiableByJury.name],
      moyenneGenerale: json[ExamNoteKey.moyenneGenerale.name],
      noteEliminatoire: json[ExamNoteKey.noteEliminatoire.name],
      noteObtenu: json[ExamNoteKey.noteObtenu.name],
      oldAbsenceJustifie: json[ExamNoteKey.oldAbsenceJustifie.name],
      oldAbsent: json[ExamNoteKey.oldAbsent.name],
      oldCopieNonRemise: json[ExamNoteKey.oldCopieNonRemise.name],
      planningSessionId: json[ExamNoteKey.planningSessionId.name],
      planningSessionIntitule: json[ExamNoteKey.planningSessionIntitule.name],
      rattachementMcCoefficient:
          json[ExamNoteKey.rattachementMcCoefficient.name],
      rattachementMcCredit: json[ExamNoteKey.rattachementMcCredit.name],
      rattachementMcId: json[ExamNoteKey.rattachementMcId.name],
      readerByJury: json[ExamNoteKey.readerByJury.name],
      subscribed: json[ExamNoteKey.subscribed.name],
      totalCoefficient: json[ExamNoteKey.totalCoefficient.name],
      ueCode: json[ExamNoteKey.ueCode.name],
      ueNatureLlFr: json[ExamNoteKey.ueNatureLlFr.name],
    );
  }
}


class ExamNotesEvent extends ServiceEvent<ExamNotesResponse>{
  ExamNotesEvent( {required super.eventData,super.callback}) : super(examNotesEventId, examNotesEventName, serviceId);
}