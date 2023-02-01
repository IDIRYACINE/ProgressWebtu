import 'package:progresswebtu/core/api/feature.dart';



class ExamSessionModel {
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

  ExamSessionModel({
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

  factory ExamSessionModel.fromApi(ExamSession session){
    return ExamSessionModel(
      anneeAcademiqueCode: session.anneeAcademiqueCode,
      anneeAcademiqueId: session.anneeAcademiqueId,
      avecControle: session.avecControle,
      avecControleContinu: session.avecControleContinu,
      avecControleIntermediaire: session.avecControleIntermediaire,
      codePeriode: session.codePeriode,
      coefficient: session.coefficient,
      coefficientNoteEliminatoire: session.coefficientNoteEliminatoire,
      cycleCode: session.cycleCode,
      cycleId: session.cycleId,
      cycleLibelleLongLt: session.cycleLibelleLongLt,
      dateCloture: session.dateCloture,
      dateCreation: session.dateCreation,
      dateDebut: session.dateDebut,
      dateFin: session.dateFin,
      datePublication: session.datePublication,
      estMigree: session.estMigree,
      id: session.id,
      idPeriode: session.idPeriode,
      intitule: session.intitule,
      libellePeriode: session.libellePeriode,
      ncTypeSessionCode: session.ncTypeSessionCode,
      ncTypeSessionId: session.ncTypeSessionId,
      ncTypeSessionLibelleFr: session.ncTypeSessionLibelleFr,
      niveauCode: session.niveauCode,
      niveauId: session.niveauId,
      niveauLibelleLongLt: session.niveauLibelleLongLt,
      nombreNote: session.nombreNote,
      notesValide: session.notesValide,
      numeroSession: session.numeroSession,
      offreFormationCode: session.offreFormationCode,
      offreFormationId: session.offreFormationId,
      offreFormationLibelleAr: session.offreFormationLibelleAr,
      offreFormationLibelleFr: session.offreFormationLibelleFr,
      ouvertureOffreFormationId: session.ouvertureOffreFormationId,
      refCodeEtablissement: session.refCodeEtablissement,
      sessionARemplacerId: session.sessionARemplacerId,
      sessionARemplacerIntitule: session.sessionARemplacerIntitule,
      situationCode: session.situationCode,
      situationId: session.situationId, situationLibelleAr: session.situationLibelleAr, situationLibelleFr: session.situationLibelleAr,
      
  


    );
  }
}

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
  final double rattachementMcCoefficient;
  final double rattachementMcCredit;
  final int rattachementMcId;
  final bool readerByJury;
  final bool subscribed;
  final double totalCoefficient;
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
