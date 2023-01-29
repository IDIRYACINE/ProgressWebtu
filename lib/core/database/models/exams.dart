import 'package:realm/realm.dart';

part 'exams.g.dart';

@RealmModel()
class _ExamNote {
  @PrimaryKey()
  late int id;

  late bool absenceJustifie;
  late bool absent;
  late bool avecControleContinu;
  late bool conge;
  late bool copieNonRemise;
  late bool etudiantRachete;
  late bool exclu;
  late int idPeriode;
  late String mcLibelleFr;
  late bool modifiableByJury;
  late double moyenneGenerale;
  late double noteEliminatoire;
  late bool noteObtenu;
  late bool oldAbsenceJustifie;
  late bool oldAbsent;
  late bool oldCopieNonRemise;
  late int planningSessionId;
  late String planningSessionIntitule;
  late double rattachementMcCoefficient;
  late double rattachementMcCredit;
  late int rattachementMcId;
  late bool readerByJury;
  late bool subscribed;
  late double totalCoefficient;
  late String ueCode;
  late String ueNatureLlFr;
}

@RealmModel()
class _ExamSession {
  @PrimaryKey()
  late String niveauCode;

  late String anneeAcademiqueCode;
  late int anneeAcademiqueId;
  late bool avecControle;
  late bool avecControleContinu;
  late bool avecControleIntermediaire;
  late String codePeriode;
  late double coefficient;
  late double coefficientNoteEliminatoire;
  late String cycleCode;
  late int cycleId;
  late String cycleLibelleLongLt;
  late String dateCloture;
  late String dateCreation;
  late String dateDebut;
  late String dateFin;
  late String datePublication;
  late bool estMigree;
  late int id;
  late int idPeriode;
  late String intitule;
  late String libellePeriode;
  late String ncTypeSessionCode;
  late int ncTypeSessionId;
  late String ncTypeSessionLibelleFr;
  late int niveauId;
  late String niveauLibelleLongLt;
  late int nombreNote;
  late bool notesValide;
  late int numeroSession;
  late String offreFormationCode;
  late int offreFormationId;
  late String offreFormationLibelleAr;
  late String offreFormationLibelleFr;
  late int ouvertureOffreFormationId;
  late String refCodeEtablissement;
  late int sessionARemplacerId;
  late String sessionARemplacerIntitule;
  late String situationCode;
  late int situationId;
  late String situationLibelleAr;
  late String situationLibelleFr;
}

@RealmModel()
class _SemetreSummary {
  @PrimaryKey()
  late int id;

  late String code;
  late int credit;
  late String libelleCourtAr;
  late String libelleCourtLt;
  late String libelleLongAr;
  late String libelleLongFrCycle;
  late String libelleLongFrNiveau;
  late String libelleLongLt;
  late String ncPeriodeCode;
  late String ncPeriodeId;
  late String ncPeriodeLibelle;
  late int rang;
  late int rangNiveau;
  late String refCodePeriode;
  late String refCodePeriodicite;
}

@RealmModel()
class _AcademicYear {
  @PrimaryKey()
  late int id;

  late String anneeAcademiqueCode;
  late int anneeAcademiqueId;
  late String cycleCode;
  late int cycleId;
  late String cycleLibelleLongLt;
  late int dossierEtudiantId;
  late DateTime individuDateNaissance;
  late int individuId;
  late String individuLieuNaissance;
  late String individuLieuNaissanceArabe;
  late String individuNomArabe;
  late String individuNomLatin;
  late String individuPrenomArabe;
  late String individuPrenomLatin;
  late double lastMoyenne;
  late String llEtablissementArabe;
  late String llEtablissementLatin;
  late double moyenneBac;
  late String nin;
  late String niveauCode;
  late int niveauId;
  late String niveauLibelleLongAr;
  late String niveauLibelleLongLt;
  late int niveauRang;
  late String numeroInscription;
  late String numeroMatricule;
  late String ofCodeDomaine;
  late String ofCodeFiliere;
  late String ofCodeSpecialite;
  late int ofIdDomaine;
  late int ofIdFiliere;
  late int ofIdSpecialite;
  late String ofLlDomaine;
  late String ofLlDomaineArabe;
  late String ofLlFiliere;
  late String ofLlFiliereArabe;
  late String ofLlSpecialite;
  late String ofLlSpecialiteArabe;
  late int ouvertureOffreFormationId;
  late String photo;
  late String refCodeCycle;
  late String refCodeEtablissement;
  late String refLibelleCycle;
  late String refLibelleCycleAr;
}

