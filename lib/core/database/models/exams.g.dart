// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ExamNote extends _ExamNote
    with RealmEntity, RealmObjectBase, RealmObject {
  ExamNote(
    int id,
    bool absenceJustifie,
    bool absent,
    bool avecControleContinu,
    bool conge,
    bool copieNonRemise,
    bool etudiantRachete,
    bool exclu,
    int idPeriode,
    String mcLibelleFr,
    bool modifiableByJury,
    double moyenneGenerale,
    double noteEliminatoire,
    bool noteObtenu,
    bool oldAbsenceJustifie,
    bool oldAbsent,
    bool oldCopieNonRemise,
    int planningSessionId,
    String planningSessionIntitule,
    double rattachementMcCoefficient,
    double rattachementMcCredit,
    int rattachementMcId,
    bool readerByJury,
    bool subscribed,
    double totalCoefficient,
    String ueCode,
    String ueNatureLlFr,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'absenceJustifie', absenceJustifie);
    RealmObjectBase.set(this, 'absent', absent);
    RealmObjectBase.set(this, 'avecControleContinu', avecControleContinu);
    RealmObjectBase.set(this, 'conge', conge);
    RealmObjectBase.set(this, 'copieNonRemise', copieNonRemise);
    RealmObjectBase.set(this, 'etudiantRachete', etudiantRachete);
    RealmObjectBase.set(this, 'exclu', exclu);
    RealmObjectBase.set(this, 'idPeriode', idPeriode);
    RealmObjectBase.set(this, 'mcLibelleFr', mcLibelleFr);
    RealmObjectBase.set(this, 'modifiableByJury', modifiableByJury);
    RealmObjectBase.set(this, 'moyenneGenerale', moyenneGenerale);
    RealmObjectBase.set(this, 'noteEliminatoire', noteEliminatoire);
    RealmObjectBase.set(this, 'noteObtenu', noteObtenu);
    RealmObjectBase.set(this, 'oldAbsenceJustifie', oldAbsenceJustifie);
    RealmObjectBase.set(this, 'oldAbsent', oldAbsent);
    RealmObjectBase.set(this, 'oldCopieNonRemise', oldCopieNonRemise);
    RealmObjectBase.set(this, 'planningSessionId', planningSessionId);
    RealmObjectBase.set(
        this, 'planningSessionIntitule', planningSessionIntitule);
    RealmObjectBase.set(
        this, 'rattachementMcCoefficient', rattachementMcCoefficient);
    RealmObjectBase.set(this, 'rattachementMcCredit', rattachementMcCredit);
    RealmObjectBase.set(this, 'rattachementMcId', rattachementMcId);
    RealmObjectBase.set(this, 'readerByJury', readerByJury);
    RealmObjectBase.set(this, 'subscribed', subscribed);
    RealmObjectBase.set(this, 'totalCoefficient', totalCoefficient);
    RealmObjectBase.set(this, 'ueCode', ueCode);
    RealmObjectBase.set(this, 'ueNatureLlFr', ueNatureLlFr);
  }

  ExamNote._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  bool get absenceJustifie =>
      RealmObjectBase.get<bool>(this, 'absenceJustifie') as bool;
  @override
  set absenceJustifie(bool value) =>
      RealmObjectBase.set(this, 'absenceJustifie', value);

  @override
  bool get absent => RealmObjectBase.get<bool>(this, 'absent') as bool;
  @override
  set absent(bool value) => RealmObjectBase.set(this, 'absent', value);

  @override
  bool get avecControleContinu =>
      RealmObjectBase.get<bool>(this, 'avecControleContinu') as bool;
  @override
  set avecControleContinu(bool value) =>
      RealmObjectBase.set(this, 'avecControleContinu', value);

  @override
  bool get conge => RealmObjectBase.get<bool>(this, 'conge') as bool;
  @override
  set conge(bool value) => RealmObjectBase.set(this, 'conge', value);

  @override
  bool get copieNonRemise =>
      RealmObjectBase.get<bool>(this, 'copieNonRemise') as bool;
  @override
  set copieNonRemise(bool value) =>
      RealmObjectBase.set(this, 'copieNonRemise', value);

  @override
  bool get etudiantRachete =>
      RealmObjectBase.get<bool>(this, 'etudiantRachete') as bool;
  @override
  set etudiantRachete(bool value) =>
      RealmObjectBase.set(this, 'etudiantRachete', value);

  @override
  bool get exclu => RealmObjectBase.get<bool>(this, 'exclu') as bool;
  @override
  set exclu(bool value) => RealmObjectBase.set(this, 'exclu', value);

  @override
  int get idPeriode => RealmObjectBase.get<int>(this, 'idPeriode') as int;
  @override
  set idPeriode(int value) => RealmObjectBase.set(this, 'idPeriode', value);

  @override
  String get mcLibelleFr =>
      RealmObjectBase.get<String>(this, 'mcLibelleFr') as String;
  @override
  set mcLibelleFr(String value) =>
      RealmObjectBase.set(this, 'mcLibelleFr', value);

  @override
  bool get modifiableByJury =>
      RealmObjectBase.get<bool>(this, 'modifiableByJury') as bool;
  @override
  set modifiableByJury(bool value) =>
      RealmObjectBase.set(this, 'modifiableByJury', value);

  @override
  double get moyenneGenerale =>
      RealmObjectBase.get<double>(this, 'moyenneGenerale') as double;
  @override
  set moyenneGenerale(double value) =>
      RealmObjectBase.set(this, 'moyenneGenerale', value);

  @override
  double get noteEliminatoire =>
      RealmObjectBase.get<double>(this, 'noteEliminatoire') as double;
  @override
  set noteEliminatoire(double value) =>
      RealmObjectBase.set(this, 'noteEliminatoire', value);

  @override
  bool get noteObtenu => RealmObjectBase.get<bool>(this, 'noteObtenu') as bool;
  @override
  set noteObtenu(bool value) => RealmObjectBase.set(this, 'noteObtenu', value);

  @override
  bool get oldAbsenceJustifie =>
      RealmObjectBase.get<bool>(this, 'oldAbsenceJustifie') as bool;
  @override
  set oldAbsenceJustifie(bool value) =>
      RealmObjectBase.set(this, 'oldAbsenceJustifie', value);

  @override
  bool get oldAbsent => RealmObjectBase.get<bool>(this, 'oldAbsent') as bool;
  @override
  set oldAbsent(bool value) => RealmObjectBase.set(this, 'oldAbsent', value);

  @override
  bool get oldCopieNonRemise =>
      RealmObjectBase.get<bool>(this, 'oldCopieNonRemise') as bool;
  @override
  set oldCopieNonRemise(bool value) =>
      RealmObjectBase.set(this, 'oldCopieNonRemise', value);

  @override
  int get planningSessionId =>
      RealmObjectBase.get<int>(this, 'planningSessionId') as int;
  @override
  set planningSessionId(int value) =>
      RealmObjectBase.set(this, 'planningSessionId', value);

  @override
  String get planningSessionIntitule =>
      RealmObjectBase.get<String>(this, 'planningSessionIntitule') as String;
  @override
  set planningSessionIntitule(String value) =>
      RealmObjectBase.set(this, 'planningSessionIntitule', value);

  @override
  double get rattachementMcCoefficient =>
      RealmObjectBase.get<double>(this, 'rattachementMcCoefficient') as double;
  @override
  set rattachementMcCoefficient(double value) =>
      RealmObjectBase.set(this, 'rattachementMcCoefficient', value);

  @override
  double get rattachementMcCredit =>
      RealmObjectBase.get<double>(this, 'rattachementMcCredit') as double;
  @override
  set rattachementMcCredit(double value) =>
      RealmObjectBase.set(this, 'rattachementMcCredit', value);

  @override
  int get rattachementMcId =>
      RealmObjectBase.get<int>(this, 'rattachementMcId') as int;
  @override
  set rattachementMcId(int value) =>
      RealmObjectBase.set(this, 'rattachementMcId', value);

  @override
  bool get readerByJury =>
      RealmObjectBase.get<bool>(this, 'readerByJury') as bool;
  @override
  set readerByJury(bool value) =>
      RealmObjectBase.set(this, 'readerByJury', value);

  @override
  bool get subscribed => RealmObjectBase.get<bool>(this, 'subscribed') as bool;
  @override
  set subscribed(bool value) => RealmObjectBase.set(this, 'subscribed', value);

  @override
  double get totalCoefficient =>
      RealmObjectBase.get<double>(this, 'totalCoefficient') as double;
  @override
  set totalCoefficient(double value) =>
      RealmObjectBase.set(this, 'totalCoefficient', value);

  @override
  String get ueCode => RealmObjectBase.get<String>(this, 'ueCode') as String;
  @override
  set ueCode(String value) => RealmObjectBase.set(this, 'ueCode', value);

  @override
  String get ueNatureLlFr =>
      RealmObjectBase.get<String>(this, 'ueNatureLlFr') as String;
  @override
  set ueNatureLlFr(String value) =>
      RealmObjectBase.set(this, 'ueNatureLlFr', value);

  @override
  Stream<RealmObjectChanges<ExamNote>> get changes =>
      RealmObjectBase.getChanges<ExamNote>(this);

  @override
  ExamNote freeze() => RealmObjectBase.freezeObject<ExamNote>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ExamNote._);
    return const SchemaObject(ObjectType.realmObject, ExamNote, 'ExamNote', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('absenceJustifie', RealmPropertyType.bool),
      SchemaProperty('absent', RealmPropertyType.bool),
      SchemaProperty('avecControleContinu', RealmPropertyType.bool),
      SchemaProperty('conge', RealmPropertyType.bool),
      SchemaProperty('copieNonRemise', RealmPropertyType.bool),
      SchemaProperty('etudiantRachete', RealmPropertyType.bool),
      SchemaProperty('exclu', RealmPropertyType.bool),
      SchemaProperty('idPeriode', RealmPropertyType.int),
      SchemaProperty('mcLibelleFr', RealmPropertyType.string),
      SchemaProperty('modifiableByJury', RealmPropertyType.bool),
      SchemaProperty('moyenneGenerale', RealmPropertyType.double),
      SchemaProperty('noteEliminatoire', RealmPropertyType.double),
      SchemaProperty('noteObtenu', RealmPropertyType.bool),
      SchemaProperty('oldAbsenceJustifie', RealmPropertyType.bool),
      SchemaProperty('oldAbsent', RealmPropertyType.bool),
      SchemaProperty('oldCopieNonRemise', RealmPropertyType.bool),
      SchemaProperty('planningSessionId', RealmPropertyType.int),
      SchemaProperty('planningSessionIntitule', RealmPropertyType.string),
      SchemaProperty('rattachementMcCoefficient', RealmPropertyType.double),
      SchemaProperty('rattachementMcCredit', RealmPropertyType.double),
      SchemaProperty('rattachementMcId', RealmPropertyType.int),
      SchemaProperty('readerByJury', RealmPropertyType.bool),
      SchemaProperty('subscribed', RealmPropertyType.bool),
      SchemaProperty('totalCoefficient', RealmPropertyType.double),
      SchemaProperty('ueCode', RealmPropertyType.string),
      SchemaProperty('ueNatureLlFr', RealmPropertyType.string),
    ]);
  }
}

class ExamSession extends _ExamSession
    with RealmEntity, RealmObjectBase, RealmObject {
  ExamSession(
    String offreFormationLibelleAr,
    String anneeAcademiqueCode,
    int anneeAcademiqueId,
    bool avecControle,
    bool avecControleContinu,
    bool avecControleIntermediaire,
    String codePeriode,
    double coefficient,
    double coefficientNoteEliminatoire,
    String cycleCode,
    int cycleId,
    int ouvertureOffreFormationId,
    String situationCode,
    String situationLibelleAr,
    String dateDebut,
    String dateFin,
    String datePublication,
    bool estMigree,
    int id,
    int idPeriode,
    String intitule,
    String offreFormationLibelleFr,
    String ncTypeSessionCode,
    String refCodeEtablissement,
    String sessionARemplacerIntitule,
    int situationId,
    String niveauLibelleLongLt,
    String situationLibelleFr,
    bool notesValide,
    int numeroSession,
    String offreFormationCode,
    int offreFormationId,
    int sessionARemplacerId,
    String libellePeriode,
    String cycleLibelleLongLt,
    int ncTypeSessionId,
    String dateCloture,
    String ncTypeSessionLibelleFr,
    String niveauCode,
    int niveauId,
    String dateCreation,
    int nombreNote,
  ) {
    RealmObjectBase.set(
        this, 'offreFormationLibelleAr', offreFormationLibelleAr);
    RealmObjectBase.set(this, 'anneeAcademiqueCode', anneeAcademiqueCode);
    RealmObjectBase.set(this, 'anneeAcademiqueId', anneeAcademiqueId);
    RealmObjectBase.set(this, 'avecControle', avecControle);
    RealmObjectBase.set(this, 'avecControleContinu', avecControleContinu);
    RealmObjectBase.set(
        this, 'avecControleIntermediaire', avecControleIntermediaire);
    RealmObjectBase.set(this, 'codePeriode', codePeriode);
    RealmObjectBase.set(this, 'coefficient', coefficient);
    RealmObjectBase.set(
        this, 'coefficientNoteEliminatoire', coefficientNoteEliminatoire);
    RealmObjectBase.set(this, 'cycleCode', cycleCode);
    RealmObjectBase.set(this, 'cycleId', cycleId);
    RealmObjectBase.set(
        this, 'ouvertureOffreFormationId', ouvertureOffreFormationId);
    RealmObjectBase.set(this, 'situationCode', situationCode);
    RealmObjectBase.set(this, 'situationLibelleAr', situationLibelleAr);
    RealmObjectBase.set(this, 'dateDebut', dateDebut);
    RealmObjectBase.set(this, 'dateFin', dateFin);
    RealmObjectBase.set(this, 'datePublication', datePublication);
    RealmObjectBase.set(this, 'estMigree', estMigree);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'idPeriode', idPeriode);
    RealmObjectBase.set(this, 'intitule', intitule);
    RealmObjectBase.set(
        this, 'offreFormationLibelleFr', offreFormationLibelleFr);
    RealmObjectBase.set(this, 'ncTypeSessionCode', ncTypeSessionCode);
    RealmObjectBase.set(this, 'refCodeEtablissement', refCodeEtablissement);
    RealmObjectBase.set(
        this, 'sessionARemplacerIntitule', sessionARemplacerIntitule);
    RealmObjectBase.set(this, 'situationId', situationId);
    RealmObjectBase.set(this, 'niveauLibelleLongLt', niveauLibelleLongLt);
    RealmObjectBase.set(this, 'situationLibelleFr', situationLibelleFr);
    RealmObjectBase.set(this, 'notesValide', notesValide);
    RealmObjectBase.set(this, 'numeroSession', numeroSession);
    RealmObjectBase.set(this, 'offreFormationCode', offreFormationCode);
    RealmObjectBase.set(this, 'offreFormationId', offreFormationId);
    RealmObjectBase.set(this, 'sessionARemplacerId', sessionARemplacerId);
    RealmObjectBase.set(this, 'libellePeriode', libellePeriode);
    RealmObjectBase.set(this, 'cycleLibelleLongLt', cycleLibelleLongLt);
    RealmObjectBase.set(this, 'ncTypeSessionId', ncTypeSessionId);
    RealmObjectBase.set(this, 'dateCloture', dateCloture);
    RealmObjectBase.set(this, 'ncTypeSessionLibelleFr', ncTypeSessionLibelleFr);
    RealmObjectBase.set(this, 'niveauCode', niveauCode);
    RealmObjectBase.set(this, 'niveauId', niveauId);
    RealmObjectBase.set(this, 'dateCreation', dateCreation);
    RealmObjectBase.set(this, 'nombreNote', nombreNote);
  }

  ExamSession._();

  @override
  String get offreFormationLibelleAr =>
      RealmObjectBase.get<String>(this, 'offreFormationLibelleAr') as String;
  @override
  set offreFormationLibelleAr(String value) =>
      RealmObjectBase.set(this, 'offreFormationLibelleAr', value);

  @override
  String get anneeAcademiqueCode =>
      RealmObjectBase.get<String>(this, 'anneeAcademiqueCode') as String;
  @override
  set anneeAcademiqueCode(String value) =>
      RealmObjectBase.set(this, 'anneeAcademiqueCode', value);

  @override
  int get anneeAcademiqueId =>
      RealmObjectBase.get<int>(this, 'anneeAcademiqueId') as int;
  @override
  set anneeAcademiqueId(int value) =>
      RealmObjectBase.set(this, 'anneeAcademiqueId', value);

  @override
  bool get avecControle =>
      RealmObjectBase.get<bool>(this, 'avecControle') as bool;
  @override
  set avecControle(bool value) =>
      RealmObjectBase.set(this, 'avecControle', value);

  @override
  bool get avecControleContinu =>
      RealmObjectBase.get<bool>(this, 'avecControleContinu') as bool;
  @override
  set avecControleContinu(bool value) =>
      RealmObjectBase.set(this, 'avecControleContinu', value);

  @override
  bool get avecControleIntermediaire =>
      RealmObjectBase.get<bool>(this, 'avecControleIntermediaire') as bool;
  @override
  set avecControleIntermediaire(bool value) =>
      RealmObjectBase.set(this, 'avecControleIntermediaire', value);

  @override
  String get codePeriode =>
      RealmObjectBase.get<String>(this, 'codePeriode') as String;
  @override
  set codePeriode(String value) =>
      RealmObjectBase.set(this, 'codePeriode', value);

  @override
  double get coefficient =>
      RealmObjectBase.get<double>(this, 'coefficient') as double;
  @override
  set coefficient(double value) =>
      RealmObjectBase.set(this, 'coefficient', value);

  @override
  double get coefficientNoteEliminatoire =>
      RealmObjectBase.get<double>(this, 'coefficientNoteEliminatoire')
          as double;
  @override
  set coefficientNoteEliminatoire(double value) =>
      RealmObjectBase.set(this, 'coefficientNoteEliminatoire', value);

  @override
  String get cycleCode =>
      RealmObjectBase.get<String>(this, 'cycleCode') as String;
  @override
  set cycleCode(String value) => RealmObjectBase.set(this, 'cycleCode', value);

  @override
  int get cycleId => RealmObjectBase.get<int>(this, 'cycleId') as int;
  @override
  set cycleId(int value) => RealmObjectBase.set(this, 'cycleId', value);

  @override
  int get ouvertureOffreFormationId =>
      RealmObjectBase.get<int>(this, 'ouvertureOffreFormationId') as int;
  @override
  set ouvertureOffreFormationId(int value) =>
      RealmObjectBase.set(this, 'ouvertureOffreFormationId', value);

  @override
  String get situationCode =>
      RealmObjectBase.get<String>(this, 'situationCode') as String;
  @override
  set situationCode(String value) =>
      RealmObjectBase.set(this, 'situationCode', value);

  @override
  String get situationLibelleAr =>
      RealmObjectBase.get<String>(this, 'situationLibelleAr') as String;
  @override
  set situationLibelleAr(String value) =>
      RealmObjectBase.set(this, 'situationLibelleAr', value);

  @override
  String get dateDebut =>
      RealmObjectBase.get<String>(this, 'dateDebut') as String;
  @override
  set dateDebut(String value) => RealmObjectBase.set(this, 'dateDebut', value);

  @override
  String get dateFin => RealmObjectBase.get<String>(this, 'dateFin') as String;
  @override
  set dateFin(String value) => RealmObjectBase.set(this, 'dateFin', value);

  @override
  String get datePublication =>
      RealmObjectBase.get<String>(this, 'datePublication') as String;
  @override
  set datePublication(String value) =>
      RealmObjectBase.set(this, 'datePublication', value);

  @override
  bool get estMigree => RealmObjectBase.get<bool>(this, 'estMigree') as bool;
  @override
  set estMigree(bool value) => RealmObjectBase.set(this, 'estMigree', value);

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get idPeriode => RealmObjectBase.get<int>(this, 'idPeriode') as int;
  @override
  set idPeriode(int value) => RealmObjectBase.set(this, 'idPeriode', value);

  @override
  String get intitule =>
      RealmObjectBase.get<String>(this, 'intitule') as String;
  @override
  set intitule(String value) => RealmObjectBase.set(this, 'intitule', value);

  @override
  String get offreFormationLibelleFr =>
      RealmObjectBase.get<String>(this, 'offreFormationLibelleFr') as String;
  @override
  set offreFormationLibelleFr(String value) =>
      RealmObjectBase.set(this, 'offreFormationLibelleFr', value);

  @override
  String get ncTypeSessionCode =>
      RealmObjectBase.get<String>(this, 'ncTypeSessionCode') as String;
  @override
  set ncTypeSessionCode(String value) =>
      RealmObjectBase.set(this, 'ncTypeSessionCode', value);

  @override
  String get refCodeEtablissement =>
      RealmObjectBase.get<String>(this, 'refCodeEtablissement') as String;
  @override
  set refCodeEtablissement(String value) =>
      RealmObjectBase.set(this, 'refCodeEtablissement', value);

  @override
  String get sessionARemplacerIntitule =>
      RealmObjectBase.get<String>(this, 'sessionARemplacerIntitule') as String;
  @override
  set sessionARemplacerIntitule(String value) =>
      RealmObjectBase.set(this, 'sessionARemplacerIntitule', value);

  @override
  int get situationId => RealmObjectBase.get<int>(this, 'situationId') as int;
  @override
  set situationId(int value) => RealmObjectBase.set(this, 'situationId', value);

  @override
  String get niveauLibelleLongLt =>
      RealmObjectBase.get<String>(this, 'niveauLibelleLongLt') as String;
  @override
  set niveauLibelleLongLt(String value) =>
      RealmObjectBase.set(this, 'niveauLibelleLongLt', value);

  @override
  String get situationLibelleFr =>
      RealmObjectBase.get<String>(this, 'situationLibelleFr') as String;
  @override
  set situationLibelleFr(String value) =>
      RealmObjectBase.set(this, 'situationLibelleFr', value);

  @override
  bool get notesValide =>
      RealmObjectBase.get<bool>(this, 'notesValide') as bool;
  @override
  set notesValide(bool value) =>
      RealmObjectBase.set(this, 'notesValide', value);

  @override
  int get numeroSession =>
      RealmObjectBase.get<int>(this, 'numeroSession') as int;
  @override
  set numeroSession(int value) =>
      RealmObjectBase.set(this, 'numeroSession', value);

  @override
  String get offreFormationCode =>
      RealmObjectBase.get<String>(this, 'offreFormationCode') as String;
  @override
  set offreFormationCode(String value) =>
      RealmObjectBase.set(this, 'offreFormationCode', value);

  @override
  int get offreFormationId =>
      RealmObjectBase.get<int>(this, 'offreFormationId') as int;
  @override
  set offreFormationId(int value) =>
      RealmObjectBase.set(this, 'offreFormationId', value);

  @override
  int get sessionARemplacerId =>
      RealmObjectBase.get<int>(this, 'sessionARemplacerId') as int;
  @override
  set sessionARemplacerId(int value) =>
      RealmObjectBase.set(this, 'sessionARemplacerId', value);

  @override
  String get libellePeriode =>
      RealmObjectBase.get<String>(this, 'libellePeriode') as String;
  @override
  set libellePeriode(String value) =>
      RealmObjectBase.set(this, 'libellePeriode', value);

  @override
  String get cycleLibelleLongLt =>
      RealmObjectBase.get<String>(this, 'cycleLibelleLongLt') as String;
  @override
  set cycleLibelleLongLt(String value) =>
      RealmObjectBase.set(this, 'cycleLibelleLongLt', value);

  @override
  int get ncTypeSessionId =>
      RealmObjectBase.get<int>(this, 'ncTypeSessionId') as int;
  @override
  set ncTypeSessionId(int value) =>
      RealmObjectBase.set(this, 'ncTypeSessionId', value);

  @override
  String get dateCloture =>
      RealmObjectBase.get<String>(this, 'dateCloture') as String;
  @override
  set dateCloture(String value) =>
      RealmObjectBase.set(this, 'dateCloture', value);

  @override
  String get ncTypeSessionLibelleFr =>
      RealmObjectBase.get<String>(this, 'ncTypeSessionLibelleFr') as String;
  @override
  set ncTypeSessionLibelleFr(String value) =>
      RealmObjectBase.set(this, 'ncTypeSessionLibelleFr', value);

  @override
  String get niveauCode =>
      RealmObjectBase.get<String>(this, 'niveauCode') as String;
  @override
  set niveauCode(String value) =>
      RealmObjectBase.set(this, 'niveauCode', value);

  @override
  int get niveauId => RealmObjectBase.get<int>(this, 'niveauId') as int;
  @override
  set niveauId(int value) => RealmObjectBase.set(this, 'niveauId', value);

  @override
  String get dateCreation =>
      RealmObjectBase.get<String>(this, 'dateCreation') as String;
  @override
  set dateCreation(String value) =>
      RealmObjectBase.set(this, 'dateCreation', value);

  @override
  int get nombreNote => RealmObjectBase.get<int>(this, 'nombreNote') as int;
  @override
  set nombreNote(int value) => RealmObjectBase.set(this, 'nombreNote', value);

  @override
  Stream<RealmObjectChanges<ExamSession>> get changes =>
      RealmObjectBase.getChanges<ExamSession>(this);

  @override
  ExamSession freeze() => RealmObjectBase.freezeObject<ExamSession>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ExamSession._);
    return const SchemaObject(
        ObjectType.realmObject, ExamSession, 'ExamSession', [
      SchemaProperty('offreFormationLibelleAr', RealmPropertyType.string),
      SchemaProperty('anneeAcademiqueCode', RealmPropertyType.string),
      SchemaProperty('anneeAcademiqueId', RealmPropertyType.int),
      SchemaProperty('avecControle', RealmPropertyType.bool),
      SchemaProperty('avecControleContinu', RealmPropertyType.bool),
      SchemaProperty('avecControleIntermediaire', RealmPropertyType.bool),
      SchemaProperty('codePeriode', RealmPropertyType.string),
      SchemaProperty('coefficient', RealmPropertyType.double),
      SchemaProperty('coefficientNoteEliminatoire', RealmPropertyType.double),
      SchemaProperty('cycleCode', RealmPropertyType.string),
      SchemaProperty('cycleId', RealmPropertyType.int),
      SchemaProperty('ouvertureOffreFormationId', RealmPropertyType.int),
      SchemaProperty('situationCode', RealmPropertyType.string),
      SchemaProperty('situationLibelleAr', RealmPropertyType.string),
      SchemaProperty('dateDebut', RealmPropertyType.string),
      SchemaProperty('dateFin', RealmPropertyType.string),
      SchemaProperty('datePublication', RealmPropertyType.string),
      SchemaProperty('estMigree', RealmPropertyType.bool),
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('idPeriode', RealmPropertyType.int),
      SchemaProperty('intitule', RealmPropertyType.string),
      SchemaProperty('offreFormationLibelleFr', RealmPropertyType.string),
      SchemaProperty('ncTypeSessionCode', RealmPropertyType.string),
      SchemaProperty('refCodeEtablissement', RealmPropertyType.string),
      SchemaProperty('sessionARemplacerIntitule', RealmPropertyType.string),
      SchemaProperty('situationId', RealmPropertyType.int),
      SchemaProperty('niveauLibelleLongLt', RealmPropertyType.string),
      SchemaProperty('situationLibelleFr', RealmPropertyType.string),
      SchemaProperty('notesValide', RealmPropertyType.bool),
      SchemaProperty('numeroSession', RealmPropertyType.int),
      SchemaProperty('offreFormationCode', RealmPropertyType.string),
      SchemaProperty('offreFormationId', RealmPropertyType.int),
      SchemaProperty('sessionARemplacerId', RealmPropertyType.int),
      SchemaProperty('libellePeriode', RealmPropertyType.string),
      SchemaProperty('cycleLibelleLongLt', RealmPropertyType.string),
      SchemaProperty('ncTypeSessionId', RealmPropertyType.int),
      SchemaProperty('dateCloture', RealmPropertyType.string),
      SchemaProperty('ncTypeSessionLibelleFr', RealmPropertyType.string),
      SchemaProperty('niveauCode', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('niveauId', RealmPropertyType.int),
      SchemaProperty('dateCreation', RealmPropertyType.string),
      SchemaProperty('nombreNote', RealmPropertyType.int),
    ]);
  }
}

class SemetreSummary extends _SemetreSummary
    with RealmEntity, RealmObjectBase, RealmObject {
  SemetreSummary(
    int id,
    String code,
    int credit,
    String libelleCourtAr,
    String libelleCourtLt,
    String libelleLongAr,
    String libelleLongFrCycle,
    String libelleLongFrNiveau,
    String libelleLongLt,
    String ncPeriodeCode,
    String ncPeriodeId,
    String ncPeriodeLibelle,
    int rang,
    int rangNiveau,
    String refCodePeriode,
    String refCodePeriodicite,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'code', code);
    RealmObjectBase.set(this, 'credit', credit);
    RealmObjectBase.set(this, 'libelleCourtAr', libelleCourtAr);
    RealmObjectBase.set(this, 'libelleCourtLt', libelleCourtLt);
    RealmObjectBase.set(this, 'libelleLongAr', libelleLongAr);
    RealmObjectBase.set(this, 'libelleLongFrCycle', libelleLongFrCycle);
    RealmObjectBase.set(this, 'libelleLongFrNiveau', libelleLongFrNiveau);
    RealmObjectBase.set(this, 'libelleLongLt', libelleLongLt);
    RealmObjectBase.set(this, 'ncPeriodeCode', ncPeriodeCode);
    RealmObjectBase.set(this, 'ncPeriodeId', ncPeriodeId);
    RealmObjectBase.set(this, 'ncPeriodeLibelle', ncPeriodeLibelle);
    RealmObjectBase.set(this, 'rang', rang);
    RealmObjectBase.set(this, 'rangNiveau', rangNiveau);
    RealmObjectBase.set(this, 'refCodePeriode', refCodePeriode);
    RealmObjectBase.set(this, 'refCodePeriodicite', refCodePeriodicite);
  }

  SemetreSummary._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get code => RealmObjectBase.get<String>(this, 'code') as String;
  @override
  set code(String value) => RealmObjectBase.set(this, 'code', value);

  @override
  int get credit => RealmObjectBase.get<int>(this, 'credit') as int;
  @override
  set credit(int value) => RealmObjectBase.set(this, 'credit', value);

  @override
  String get libelleCourtAr =>
      RealmObjectBase.get<String>(this, 'libelleCourtAr') as String;
  @override
  set libelleCourtAr(String value) =>
      RealmObjectBase.set(this, 'libelleCourtAr', value);

  @override
  String get libelleCourtLt =>
      RealmObjectBase.get<String>(this, 'libelleCourtLt') as String;
  @override
  set libelleCourtLt(String value) =>
      RealmObjectBase.set(this, 'libelleCourtLt', value);

  @override
  String get libelleLongAr =>
      RealmObjectBase.get<String>(this, 'libelleLongAr') as String;
  @override
  set libelleLongAr(String value) =>
      RealmObjectBase.set(this, 'libelleLongAr', value);

  @override
  String get libelleLongFrCycle =>
      RealmObjectBase.get<String>(this, 'libelleLongFrCycle') as String;
  @override
  set libelleLongFrCycle(String value) =>
      RealmObjectBase.set(this, 'libelleLongFrCycle', value);

  @override
  String get libelleLongFrNiveau =>
      RealmObjectBase.get<String>(this, 'libelleLongFrNiveau') as String;
  @override
  set libelleLongFrNiveau(String value) =>
      RealmObjectBase.set(this, 'libelleLongFrNiveau', value);

  @override
  String get libelleLongLt =>
      RealmObjectBase.get<String>(this, 'libelleLongLt') as String;
  @override
  set libelleLongLt(String value) =>
      RealmObjectBase.set(this, 'libelleLongLt', value);

  @override
  String get ncPeriodeCode =>
      RealmObjectBase.get<String>(this, 'ncPeriodeCode') as String;
  @override
  set ncPeriodeCode(String value) =>
      RealmObjectBase.set(this, 'ncPeriodeCode', value);

  @override
  String get ncPeriodeId =>
      RealmObjectBase.get<String>(this, 'ncPeriodeId') as String;
  @override
  set ncPeriodeId(String value) =>
      RealmObjectBase.set(this, 'ncPeriodeId', value);

  @override
  String get ncPeriodeLibelle =>
      RealmObjectBase.get<String>(this, 'ncPeriodeLibelle') as String;
  @override
  set ncPeriodeLibelle(String value) =>
      RealmObjectBase.set(this, 'ncPeriodeLibelle', value);

  @override
  int get rang => RealmObjectBase.get<int>(this, 'rang') as int;
  @override
  set rang(int value) => RealmObjectBase.set(this, 'rang', value);

  @override
  int get rangNiveau => RealmObjectBase.get<int>(this, 'rangNiveau') as int;
  @override
  set rangNiveau(int value) => RealmObjectBase.set(this, 'rangNiveau', value);

  @override
  String get refCodePeriode =>
      RealmObjectBase.get<String>(this, 'refCodePeriode') as String;
  @override
  set refCodePeriode(String value) =>
      RealmObjectBase.set(this, 'refCodePeriode', value);

  @override
  String get refCodePeriodicite =>
      RealmObjectBase.get<String>(this, 'refCodePeriodicite') as String;
  @override
  set refCodePeriodicite(String value) =>
      RealmObjectBase.set(this, 'refCodePeriodicite', value);

  @override
  Stream<RealmObjectChanges<SemetreSummary>> get changes =>
      RealmObjectBase.getChanges<SemetreSummary>(this);

  @override
  SemetreSummary freeze() => RealmObjectBase.freezeObject<SemetreSummary>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SemetreSummary._);
    return const SchemaObject(
        ObjectType.realmObject, SemetreSummary, 'SemetreSummary', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('code', RealmPropertyType.string),
      SchemaProperty('credit', RealmPropertyType.int),
      SchemaProperty('libelleCourtAr', RealmPropertyType.string),
      SchemaProperty('libelleCourtLt', RealmPropertyType.string),
      SchemaProperty('libelleLongAr', RealmPropertyType.string),
      SchemaProperty('libelleLongFrCycle', RealmPropertyType.string),
      SchemaProperty('libelleLongFrNiveau', RealmPropertyType.string),
      SchemaProperty('libelleLongLt', RealmPropertyType.string),
      SchemaProperty('ncPeriodeCode', RealmPropertyType.string),
      SchemaProperty('ncPeriodeId', RealmPropertyType.string),
      SchemaProperty('ncPeriodeLibelle', RealmPropertyType.string),
      SchemaProperty('rang', RealmPropertyType.int),
      SchemaProperty('rangNiveau', RealmPropertyType.int),
      SchemaProperty('refCodePeriode', RealmPropertyType.string),
      SchemaProperty('refCodePeriodicite', RealmPropertyType.string),
    ]);
  }
}

class AcademicYear extends _AcademicYear
    with RealmEntity, RealmObjectBase, RealmObject {
  AcademicYear(
    String ofLlDomaine,
    String anneeAcademiqueCode,
    int anneeAcademiqueId,
    String cycleCode,
    int cycleId,
    String cycleLibelleLongLt,
    int dossierEtudiantId,
    DateTime individuDateNaissance,
    int individuId,
    String individuLieuNaissance,
    String individuLieuNaissanceArabe,
    String individuNomArabe,
    String ofLlFiliere,
    int ouvertureOffreFormationId,
    String refCodeCycle,
    int id,
    String llEtablissementArabe,
    String llEtablissementLatin,
    double moyenneBac,
    String nin,
    String niveauCode,
    int niveauId,
    String ofLlDomaineArabe,
    String niveauLibelleLongLt,
    String ofLlFiliereArabe,
    String ofLlSpecialiteArabe,
    String photo,
    String ofCodeDomaine,
    String refCodeEtablissement,
    String refLibelleCycleAr,
    int ofIdDomaine,
    int ofIdFiliere,
    int ofIdSpecialite,
    String ofLlSpecialite,
    String niveauLibelleLongAr,
    String individuNomLatin,
    int niveauRang,
    String individuPrenomArabe,
    String numeroInscription,
    String refLibelleCycle,
    String numeroMatricule,
    String individuPrenomLatin,
    String ofCodeFiliere,
    double lastMoyenne,
    String ofCodeSpecialite,
  ) {
    RealmObjectBase.set(this, 'ofLlDomaine', ofLlDomaine);
    RealmObjectBase.set(this, 'anneeAcademiqueCode', anneeAcademiqueCode);
    RealmObjectBase.set(this, 'anneeAcademiqueId', anneeAcademiqueId);
    RealmObjectBase.set(this, 'cycleCode', cycleCode);
    RealmObjectBase.set(this, 'cycleId', cycleId);
    RealmObjectBase.set(this, 'cycleLibelleLongLt', cycleLibelleLongLt);
    RealmObjectBase.set(this, 'dossierEtudiantId', dossierEtudiantId);
    RealmObjectBase.set(this, 'individuDateNaissance', individuDateNaissance);
    RealmObjectBase.set(this, 'individuId', individuId);
    RealmObjectBase.set(this, 'individuLieuNaissance', individuLieuNaissance);
    RealmObjectBase.set(
        this, 'individuLieuNaissanceArabe', individuLieuNaissanceArabe);
    RealmObjectBase.set(this, 'individuNomArabe', individuNomArabe);
    RealmObjectBase.set(this, 'ofLlFiliere', ofLlFiliere);
    RealmObjectBase.set(
        this, 'ouvertureOffreFormationId', ouvertureOffreFormationId);
    RealmObjectBase.set(this, 'refCodeCycle', refCodeCycle);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'llEtablissementArabe', llEtablissementArabe);
    RealmObjectBase.set(this, 'llEtablissementLatin', llEtablissementLatin);
    RealmObjectBase.set(this, 'moyenneBac', moyenneBac);
    RealmObjectBase.set(this, 'nin', nin);
    RealmObjectBase.set(this, 'niveauCode', niveauCode);
    RealmObjectBase.set(this, 'niveauId', niveauId);
    RealmObjectBase.set(this, 'ofLlDomaineArabe', ofLlDomaineArabe);
    RealmObjectBase.set(this, 'niveauLibelleLongLt', niveauLibelleLongLt);
    RealmObjectBase.set(this, 'ofLlFiliereArabe', ofLlFiliereArabe);
    RealmObjectBase.set(this, 'ofLlSpecialiteArabe', ofLlSpecialiteArabe);
    RealmObjectBase.set(this, 'photo', photo);
    RealmObjectBase.set(this, 'ofCodeDomaine', ofCodeDomaine);
    RealmObjectBase.set(this, 'refCodeEtablissement', refCodeEtablissement);
    RealmObjectBase.set(this, 'refLibelleCycleAr', refLibelleCycleAr);
    RealmObjectBase.set(this, 'ofIdDomaine', ofIdDomaine);
    RealmObjectBase.set(this, 'ofIdFiliere', ofIdFiliere);
    RealmObjectBase.set(this, 'ofIdSpecialite', ofIdSpecialite);
    RealmObjectBase.set(this, 'ofLlSpecialite', ofLlSpecialite);
    RealmObjectBase.set(this, 'niveauLibelleLongAr', niveauLibelleLongAr);
    RealmObjectBase.set(this, 'individuNomLatin', individuNomLatin);
    RealmObjectBase.set(this, 'niveauRang', niveauRang);
    RealmObjectBase.set(this, 'individuPrenomArabe', individuPrenomArabe);
    RealmObjectBase.set(this, 'numeroInscription', numeroInscription);
    RealmObjectBase.set(this, 'refLibelleCycle', refLibelleCycle);
    RealmObjectBase.set(this, 'numeroMatricule', numeroMatricule);
    RealmObjectBase.set(this, 'individuPrenomLatin', individuPrenomLatin);
    RealmObjectBase.set(this, 'ofCodeFiliere', ofCodeFiliere);
    RealmObjectBase.set(this, 'lastMoyenne', lastMoyenne);
    RealmObjectBase.set(this, 'ofCodeSpecialite', ofCodeSpecialite);
  }

  AcademicYear._();

  @override
  String get ofLlDomaine =>
      RealmObjectBase.get<String>(this, 'ofLlDomaine') as String;
  @override
  set ofLlDomaine(String value) =>
      RealmObjectBase.set(this, 'ofLlDomaine', value);

  @override
  String get anneeAcademiqueCode =>
      RealmObjectBase.get<String>(this, 'anneeAcademiqueCode') as String;
  @override
  set anneeAcademiqueCode(String value) =>
      RealmObjectBase.set(this, 'anneeAcademiqueCode', value);

  @override
  int get anneeAcademiqueId =>
      RealmObjectBase.get<int>(this, 'anneeAcademiqueId') as int;
  @override
  set anneeAcademiqueId(int value) =>
      RealmObjectBase.set(this, 'anneeAcademiqueId', value);

  @override
  String get cycleCode =>
      RealmObjectBase.get<String>(this, 'cycleCode') as String;
  @override
  set cycleCode(String value) => RealmObjectBase.set(this, 'cycleCode', value);

  @override
  int get cycleId => RealmObjectBase.get<int>(this, 'cycleId') as int;
  @override
  set cycleId(int value) => RealmObjectBase.set(this, 'cycleId', value);

  @override
  String get cycleLibelleLongLt =>
      RealmObjectBase.get<String>(this, 'cycleLibelleLongLt') as String;
  @override
  set cycleLibelleLongLt(String value) =>
      RealmObjectBase.set(this, 'cycleLibelleLongLt', value);

  @override
  int get dossierEtudiantId =>
      RealmObjectBase.get<int>(this, 'dossierEtudiantId') as int;
  @override
  set dossierEtudiantId(int value) =>
      RealmObjectBase.set(this, 'dossierEtudiantId', value);

  @override
  DateTime get individuDateNaissance =>
      RealmObjectBase.get<DateTime>(this, 'individuDateNaissance') as DateTime;
  @override
  set individuDateNaissance(DateTime value) =>
      RealmObjectBase.set(this, 'individuDateNaissance', value);

  @override
  int get individuId => RealmObjectBase.get<int>(this, 'individuId') as int;
  @override
  set individuId(int value) => RealmObjectBase.set(this, 'individuId', value);

  @override
  String get individuLieuNaissance =>
      RealmObjectBase.get<String>(this, 'individuLieuNaissance') as String;
  @override
  set individuLieuNaissance(String value) =>
      RealmObjectBase.set(this, 'individuLieuNaissance', value);

  @override
  String get individuLieuNaissanceArabe =>
      RealmObjectBase.get<String>(this, 'individuLieuNaissanceArabe') as String;
  @override
  set individuLieuNaissanceArabe(String value) =>
      RealmObjectBase.set(this, 'individuLieuNaissanceArabe', value);

  @override
  String get individuNomArabe =>
      RealmObjectBase.get<String>(this, 'individuNomArabe') as String;
  @override
  set individuNomArabe(String value) =>
      RealmObjectBase.set(this, 'individuNomArabe', value);

  @override
  String get ofLlFiliere =>
      RealmObjectBase.get<String>(this, 'ofLlFiliere') as String;
  @override
  set ofLlFiliere(String value) =>
      RealmObjectBase.set(this, 'ofLlFiliere', value);

  @override
  int get ouvertureOffreFormationId =>
      RealmObjectBase.get<int>(this, 'ouvertureOffreFormationId') as int;
  @override
  set ouvertureOffreFormationId(int value) =>
      RealmObjectBase.set(this, 'ouvertureOffreFormationId', value);

  @override
  String get refCodeCycle =>
      RealmObjectBase.get<String>(this, 'refCodeCycle') as String;
  @override
  set refCodeCycle(String value) =>
      RealmObjectBase.set(this, 'refCodeCycle', value);

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get llEtablissementArabe =>
      RealmObjectBase.get<String>(this, 'llEtablissementArabe') as String;
  @override
  set llEtablissementArabe(String value) =>
      RealmObjectBase.set(this, 'llEtablissementArabe', value);

  @override
  String get llEtablissementLatin =>
      RealmObjectBase.get<String>(this, 'llEtablissementLatin') as String;
  @override
  set llEtablissementLatin(String value) =>
      RealmObjectBase.set(this, 'llEtablissementLatin', value);

  @override
  double get moyenneBac =>
      RealmObjectBase.get<double>(this, 'moyenneBac') as double;
  @override
  set moyenneBac(double value) =>
      RealmObjectBase.set(this, 'moyenneBac', value);

  @override
  String get nin => RealmObjectBase.get<String>(this, 'nin') as String;
  @override
  set nin(String value) => RealmObjectBase.set(this, 'nin', value);

  @override
  String get niveauCode =>
      RealmObjectBase.get<String>(this, 'niveauCode') as String;
  @override
  set niveauCode(String value) =>
      RealmObjectBase.set(this, 'niveauCode', value);

  @override
  int get niveauId => RealmObjectBase.get<int>(this, 'niveauId') as int;
  @override
  set niveauId(int value) => RealmObjectBase.set(this, 'niveauId', value);

  @override
  String get ofLlDomaineArabe =>
      RealmObjectBase.get<String>(this, 'ofLlDomaineArabe') as String;
  @override
  set ofLlDomaineArabe(String value) =>
      RealmObjectBase.set(this, 'ofLlDomaineArabe', value);

  @override
  String get niveauLibelleLongLt =>
      RealmObjectBase.get<String>(this, 'niveauLibelleLongLt') as String;
  @override
  set niveauLibelleLongLt(String value) =>
      RealmObjectBase.set(this, 'niveauLibelleLongLt', value);

  @override
  String get ofLlFiliereArabe =>
      RealmObjectBase.get<String>(this, 'ofLlFiliereArabe') as String;
  @override
  set ofLlFiliereArabe(String value) =>
      RealmObjectBase.set(this, 'ofLlFiliereArabe', value);

  @override
  String get ofLlSpecialiteArabe =>
      RealmObjectBase.get<String>(this, 'ofLlSpecialiteArabe') as String;
  @override
  set ofLlSpecialiteArabe(String value) =>
      RealmObjectBase.set(this, 'ofLlSpecialiteArabe', value);

  @override
  String get photo => RealmObjectBase.get<String>(this, 'photo') as String;
  @override
  set photo(String value) => RealmObjectBase.set(this, 'photo', value);

  @override
  String get ofCodeDomaine =>
      RealmObjectBase.get<String>(this, 'ofCodeDomaine') as String;
  @override
  set ofCodeDomaine(String value) =>
      RealmObjectBase.set(this, 'ofCodeDomaine', value);

  @override
  String get refCodeEtablissement =>
      RealmObjectBase.get<String>(this, 'refCodeEtablissement') as String;
  @override
  set refCodeEtablissement(String value) =>
      RealmObjectBase.set(this, 'refCodeEtablissement', value);

  @override
  String get refLibelleCycleAr =>
      RealmObjectBase.get<String>(this, 'refLibelleCycleAr') as String;
  @override
  set refLibelleCycleAr(String value) =>
      RealmObjectBase.set(this, 'refLibelleCycleAr', value);

  @override
  int get ofIdDomaine => RealmObjectBase.get<int>(this, 'ofIdDomaine') as int;
  @override
  set ofIdDomaine(int value) => RealmObjectBase.set(this, 'ofIdDomaine', value);

  @override
  int get ofIdFiliere => RealmObjectBase.get<int>(this, 'ofIdFiliere') as int;
  @override
  set ofIdFiliere(int value) => RealmObjectBase.set(this, 'ofIdFiliere', value);

  @override
  int get ofIdSpecialite =>
      RealmObjectBase.get<int>(this, 'ofIdSpecialite') as int;
  @override
  set ofIdSpecialite(int value) =>
      RealmObjectBase.set(this, 'ofIdSpecialite', value);

  @override
  String get ofLlSpecialite =>
      RealmObjectBase.get<String>(this, 'ofLlSpecialite') as String;
  @override
  set ofLlSpecialite(String value) =>
      RealmObjectBase.set(this, 'ofLlSpecialite', value);

  @override
  String get niveauLibelleLongAr =>
      RealmObjectBase.get<String>(this, 'niveauLibelleLongAr') as String;
  @override
  set niveauLibelleLongAr(String value) =>
      RealmObjectBase.set(this, 'niveauLibelleLongAr', value);

  @override
  String get individuNomLatin =>
      RealmObjectBase.get<String>(this, 'individuNomLatin') as String;
  @override
  set individuNomLatin(String value) =>
      RealmObjectBase.set(this, 'individuNomLatin', value);

  @override
  int get niveauRang => RealmObjectBase.get<int>(this, 'niveauRang') as int;
  @override
  set niveauRang(int value) => RealmObjectBase.set(this, 'niveauRang', value);

  @override
  String get individuPrenomArabe =>
      RealmObjectBase.get<String>(this, 'individuPrenomArabe') as String;
  @override
  set individuPrenomArabe(String value) =>
      RealmObjectBase.set(this, 'individuPrenomArabe', value);

  @override
  String get numeroInscription =>
      RealmObjectBase.get<String>(this, 'numeroInscription') as String;
  @override
  set numeroInscription(String value) =>
      RealmObjectBase.set(this, 'numeroInscription', value);

  @override
  String get refLibelleCycle =>
      RealmObjectBase.get<String>(this, 'refLibelleCycle') as String;
  @override
  set refLibelleCycle(String value) =>
      RealmObjectBase.set(this, 'refLibelleCycle', value);

  @override
  String get numeroMatricule =>
      RealmObjectBase.get<String>(this, 'numeroMatricule') as String;
  @override
  set numeroMatricule(String value) =>
      RealmObjectBase.set(this, 'numeroMatricule', value);

  @override
  String get individuPrenomLatin =>
      RealmObjectBase.get<String>(this, 'individuPrenomLatin') as String;
  @override
  set individuPrenomLatin(String value) =>
      RealmObjectBase.set(this, 'individuPrenomLatin', value);

  @override
  String get ofCodeFiliere =>
      RealmObjectBase.get<String>(this, 'ofCodeFiliere') as String;
  @override
  set ofCodeFiliere(String value) =>
      RealmObjectBase.set(this, 'ofCodeFiliere', value);

  @override
  double get lastMoyenne =>
      RealmObjectBase.get<double>(this, 'lastMoyenne') as double;
  @override
  set lastMoyenne(double value) =>
      RealmObjectBase.set(this, 'lastMoyenne', value);

  @override
  String get ofCodeSpecialite =>
      RealmObjectBase.get<String>(this, 'ofCodeSpecialite') as String;
  @override
  set ofCodeSpecialite(String value) =>
      RealmObjectBase.set(this, 'ofCodeSpecialite', value);

  @override
  Stream<RealmObjectChanges<AcademicYear>> get changes =>
      RealmObjectBase.getChanges<AcademicYear>(this);

  @override
  AcademicYear freeze() => RealmObjectBase.freezeObject<AcademicYear>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AcademicYear._);
    return const SchemaObject(
        ObjectType.realmObject, AcademicYear, 'AcademicYear', [
      SchemaProperty('ofLlDomaine', RealmPropertyType.string),
      SchemaProperty('anneeAcademiqueCode', RealmPropertyType.string),
      SchemaProperty('anneeAcademiqueId', RealmPropertyType.int),
      SchemaProperty('cycleCode', RealmPropertyType.string),
      SchemaProperty('cycleId', RealmPropertyType.int),
      SchemaProperty('cycleLibelleLongLt', RealmPropertyType.string),
      SchemaProperty('dossierEtudiantId', RealmPropertyType.int),
      SchemaProperty('individuDateNaissance', RealmPropertyType.timestamp),
      SchemaProperty('individuId', RealmPropertyType.int),
      SchemaProperty('individuLieuNaissance', RealmPropertyType.string),
      SchemaProperty('individuLieuNaissanceArabe', RealmPropertyType.string),
      SchemaProperty('individuNomArabe', RealmPropertyType.string),
      SchemaProperty('ofLlFiliere', RealmPropertyType.string),
      SchemaProperty('ouvertureOffreFormationId', RealmPropertyType.int),
      SchemaProperty('refCodeCycle', RealmPropertyType.string),
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('llEtablissementArabe', RealmPropertyType.string),
      SchemaProperty('llEtablissementLatin', RealmPropertyType.string),
      SchemaProperty('moyenneBac', RealmPropertyType.double),
      SchemaProperty('nin', RealmPropertyType.string),
      SchemaProperty('niveauCode', RealmPropertyType.string),
      SchemaProperty('niveauId', RealmPropertyType.int),
      SchemaProperty('ofLlDomaineArabe', RealmPropertyType.string),
      SchemaProperty('niveauLibelleLongLt', RealmPropertyType.string),
      SchemaProperty('ofLlFiliereArabe', RealmPropertyType.string),
      SchemaProperty('ofLlSpecialiteArabe', RealmPropertyType.string),
      SchemaProperty('photo', RealmPropertyType.string),
      SchemaProperty('ofCodeDomaine', RealmPropertyType.string),
      SchemaProperty('refCodeEtablissement', RealmPropertyType.string),
      SchemaProperty('refLibelleCycleAr', RealmPropertyType.string),
      SchemaProperty('ofIdDomaine', RealmPropertyType.int),
      SchemaProperty('ofIdFiliere', RealmPropertyType.int),
      SchemaProperty('ofIdSpecialite', RealmPropertyType.int),
      SchemaProperty('ofLlSpecialite', RealmPropertyType.string),
      SchemaProperty('niveauLibelleLongAr', RealmPropertyType.string),
      SchemaProperty('individuNomLatin', RealmPropertyType.string),
      SchemaProperty('niveauRang', RealmPropertyType.int),
      SchemaProperty('individuPrenomArabe', RealmPropertyType.string),
      SchemaProperty('numeroInscription', RealmPropertyType.string),
      SchemaProperty('refLibelleCycle', RealmPropertyType.string),
      SchemaProperty('numeroMatricule', RealmPropertyType.string),
      SchemaProperty('individuPrenomLatin', RealmPropertyType.string),
      SchemaProperty('ofCodeFiliere', RealmPropertyType.string),
      SchemaProperty('lastMoyenne', RealmPropertyType.double),
      SchemaProperty('ofCodeSpecialite', RealmPropertyType.string),
    ]);
  }
}
