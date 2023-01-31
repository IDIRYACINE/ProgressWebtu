
import 'package:progresswebtu/core/api/feature.dart';

class ExamsNoteModel {
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
  final int rattachementMcCoefficient;
  final int rattachementMcCredit;
  final int rattachementMcId;
  final bool readerByJury;
  final bool subscribed;
  final int totalCoefficient;
  final String ueCode;
  final String ueNatureLlFr;
  final double examNote;

  ExamsNoteModel({
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
    required this.examNote,
  });

  factory ExamsNoteModel.fromApiResponse(ExamNote note) {
    return ExamsNoteModel(
        absenceJustifie: note.absenceJustifie,
        absent: note.absent,
        avecControleContinu: note.avecControleContinu,
        conge: note.conge,
        copieNonRemise: note.copieNonRemise,
        etudiantRachete: note.etudiantRachete,
        exclu: note.exclu,
        id: note.id,
        idPeriode: note.idPeriode,
        mcLibelleFr: note.mcLibelleFr,
        modifiableByJury: note.modifiableByJury,
        moyenneGenerale: note.moyenneGenerale,
        noteEliminatoire: note.noteEliminatoire,
        noteObtenu: note.noteObtenu,
        oldAbsenceJustifie: note.oldAbsenceJustifie,
        oldAbsent: note.oldAbsent,
        oldCopieNonRemise: note.oldCopieNonRemise,
        planningSessionId: note.planningSessionId,
        planningSessionIntitule: note.planningSessionIntitule,
        rattachementMcCoefficient: note.rattachementMcCoefficient,
        rattachementMcCredit: note.rattachementMcCredit,
        rattachementMcId: note.rattachementMcId,
        readerByJury: note.readerByJury,
        subscribed: note.subscribed,
        totalCoefficient: note.totalCoefficient,
        ueCode: note.ueCode,
        examNote: note.examNote,
        ueNatureLlFr: note.ueNatureLlFr);
  }
}
