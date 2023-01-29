// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class BacSummary extends _BacSummary
    with RealmEntity, RealmObjectBase, RealmObject {
  BacSummary(
    String anneeBac,
    String dateNaissance,
    int id,
    String libelleSerieBac,
    String matricule,
    String moyenneBac,
    double moyenneGeneraleBac,
    String nin,
    String nomAr,
    String nomFr,
    String prenomAr,
    String prenomFr,
    String refCodeSerieBac,
    String refCodeWilayaBac, {
    Iterable<BacNote> bacNotes = const [],
  }) {
    RealmObjectBase.set(this, 'anneeBac', anneeBac);
    RealmObjectBase.set(this, 'dateNaissance', dateNaissance);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'libelleSerieBac', libelleSerieBac);
    RealmObjectBase.set(this, 'matricule', matricule);
    RealmObjectBase.set(this, 'moyenneBac', moyenneBac);
    RealmObjectBase.set(this, 'moyenneGeneraleBac', moyenneGeneraleBac);
    RealmObjectBase.set(this, 'nin', nin);
    RealmObjectBase.set(this, 'nomAr', nomAr);
    RealmObjectBase.set(this, 'nomFr', nomFr);
    RealmObjectBase.set(this, 'prenomAr', prenomAr);
    RealmObjectBase.set(this, 'prenomFr', prenomFr);
    RealmObjectBase.set(this, 'refCodeSerieBac', refCodeSerieBac);
    RealmObjectBase.set(this, 'refCodeWilayaBac', refCodeWilayaBac);
    RealmObjectBase.set<RealmList<BacNote>>(
        this, 'bacNotes', RealmList<BacNote>(bacNotes));
  }

  BacSummary._();

  @override
  String get anneeBac =>
      RealmObjectBase.get<String>(this, 'anneeBac') as String;
  @override
  set anneeBac(String value) => RealmObjectBase.set(this, 'anneeBac', value);

  @override
  String get dateNaissance =>
      RealmObjectBase.get<String>(this, 'dateNaissance') as String;
  @override
  set dateNaissance(String value) =>
      RealmObjectBase.set(this, 'dateNaissance', value);

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get libelleSerieBac =>
      RealmObjectBase.get<String>(this, 'libelleSerieBac') as String;
  @override
  set libelleSerieBac(String value) =>
      RealmObjectBase.set(this, 'libelleSerieBac', value);

  @override
  String get matricule =>
      RealmObjectBase.get<String>(this, 'matricule') as String;
  @override
  set matricule(String value) => RealmObjectBase.set(this, 'matricule', value);

  @override
  String get moyenneBac =>
      RealmObjectBase.get<String>(this, 'moyenneBac') as String;
  @override
  set moyenneBac(String value) =>
      RealmObjectBase.set(this, 'moyenneBac', value);

  @override
  double get moyenneGeneraleBac =>
      RealmObjectBase.get<double>(this, 'moyenneGeneraleBac') as double;
  @override
  set moyenneGeneraleBac(double value) =>
      RealmObjectBase.set(this, 'moyenneGeneraleBac', value);

  @override
  String get nin => RealmObjectBase.get<String>(this, 'nin') as String;
  @override
  set nin(String value) => RealmObjectBase.set(this, 'nin', value);

  @override
  String get nomAr => RealmObjectBase.get<String>(this, 'nomAr') as String;
  @override
  set nomAr(String value) => RealmObjectBase.set(this, 'nomAr', value);

  @override
  String get nomFr => RealmObjectBase.get<String>(this, 'nomFr') as String;
  @override
  set nomFr(String value) => RealmObjectBase.set(this, 'nomFr', value);

  @override
  String get prenomAr =>
      RealmObjectBase.get<String>(this, 'prenomAr') as String;
  @override
  set prenomAr(String value) => RealmObjectBase.set(this, 'prenomAr', value);

  @override
  String get prenomFr =>
      RealmObjectBase.get<String>(this, 'prenomFr') as String;
  @override
  set prenomFr(String value) => RealmObjectBase.set(this, 'prenomFr', value);

  @override
  String get refCodeSerieBac =>
      RealmObjectBase.get<String>(this, 'refCodeSerieBac') as String;
  @override
  set refCodeSerieBac(String value) =>
      RealmObjectBase.set(this, 'refCodeSerieBac', value);

  @override
  String get refCodeWilayaBac =>
      RealmObjectBase.get<String>(this, 'refCodeWilayaBac') as String;
  @override
  set refCodeWilayaBac(String value) =>
      RealmObjectBase.set(this, 'refCodeWilayaBac', value);

  @override
  RealmList<BacNote> get bacNotes =>
      RealmObjectBase.get<BacNote>(this, 'bacNotes') as RealmList<BacNote>;
  @override
  set bacNotes(covariant RealmList<BacNote> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<BacSummary>> get changes =>
      RealmObjectBase.getChanges<BacSummary>(this);

  @override
  BacSummary freeze() => RealmObjectBase.freezeObject<BacSummary>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BacSummary._);
    return const SchemaObject(
        ObjectType.realmObject, BacSummary, 'BacSummary', [
      SchemaProperty('anneeBac', RealmPropertyType.string),
      SchemaProperty('dateNaissance', RealmPropertyType.string),
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('libelleSerieBac', RealmPropertyType.string),
      SchemaProperty('matricule', RealmPropertyType.string),
      SchemaProperty('moyenneBac', RealmPropertyType.string),
      SchemaProperty('moyenneGeneraleBac', RealmPropertyType.double),
      SchemaProperty('nin', RealmPropertyType.string),
      SchemaProperty('nomAr', RealmPropertyType.string),
      SchemaProperty('nomFr', RealmPropertyType.string),
      SchemaProperty('prenomAr', RealmPropertyType.string),
      SchemaProperty('prenomFr', RealmPropertyType.string),
      SchemaProperty('refCodeSerieBac', RealmPropertyType.string),
      SchemaProperty('refCodeWilayaBac', RealmPropertyType.string),
      SchemaProperty('bacNotes', RealmPropertyType.object,
          linkTarget: 'BacNote', collectionType: RealmCollectionType.list),
    ]);
  }
}

class BacNote extends _BacNote with RealmEntity, RealmObjectBase, RealmObject {
  BacNote(
    double note,
    String refCodeMatiere,
  ) {
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'refCodeMatiere', refCodeMatiere);
  }

  BacNote._();

  @override
  double get note => RealmObjectBase.get<double>(this, 'note') as double;
  @override
  set note(double value) => RealmObjectBase.set(this, 'note', value);

  @override
  String get refCodeMatiere =>
      RealmObjectBase.get<String>(this, 'refCodeMatiere') as String;
  @override
  set refCodeMatiere(String value) =>
      RealmObjectBase.set(this, 'refCodeMatiere', value);

  @override
  Stream<RealmObjectChanges<BacNote>> get changes =>
      RealmObjectBase.getChanges<BacNote>(this);

  @override
  BacNote freeze() => RealmObjectBase.freezeObject<BacNote>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BacNote._);
    return const SchemaObject(ObjectType.realmObject, BacNote, 'BacNote', [
      SchemaProperty('note', RealmPropertyType.double),
      SchemaProperty('refCodeMatiere', RealmPropertyType.string),
    ]);
  }
}

class AppUser extends _AppUser with RealmEntity, RealmObjectBase, RealmObject {
  AppUser(
    String username,
    String password,
    String authKey,
    String authKeyExpiration,
  ) {
    RealmObjectBase.set(this, 'username', username);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'authKey', authKey);
    RealmObjectBase.set(this, 'authKeyExpiration', authKeyExpiration);
  }

  AppUser._();

  @override
  String get username =>
      RealmObjectBase.get<String>(this, 'username') as String;
  @override
  set username(String value) => RealmObjectBase.set(this, 'username', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  String get authKey => RealmObjectBase.get<String>(this, 'authKey') as String;
  @override
  set authKey(String value) => RealmObjectBase.set(this, 'authKey', value);

  @override
  String get authKeyExpiration =>
      RealmObjectBase.get<String>(this, 'authKeyExpiration') as String;
  @override
  set authKeyExpiration(String value) =>
      RealmObjectBase.set(this, 'authKeyExpiration', value);

  @override
  Stream<RealmObjectChanges<AppUser>> get changes =>
      RealmObjectBase.getChanges<AppUser>(this);

  @override
  AppUser freeze() => RealmObjectBase.freezeObject<AppUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AppUser._);
    return const SchemaObject(ObjectType.realmObject, AppUser, 'AppUser', [
      SchemaProperty('username', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('authKey', RealmPropertyType.string),
      SchemaProperty('authKeyExpiration', RealmPropertyType.string),
    ]);
  }
}

class Section extends _Section with RealmEntity, RealmObjectBase, RealmObject {
  Section(
    int id,
    String dateAffectation,
    int groupePedagogiqueId,
    String nomGroupePedagogique,
    String nomSection,
    String periodeCode,
    int periodeId,
    String periodeLibelleLongLt,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'dateAffectation', dateAffectation);
    RealmObjectBase.set(this, 'groupePedagogiqueId', groupePedagogiqueId);
    RealmObjectBase.set(this, 'nomGroupePedagogique', nomGroupePedagogique);
    RealmObjectBase.set(this, 'nomSection', nomSection);
    RealmObjectBase.set(this, 'periodeCode', periodeCode);
    RealmObjectBase.set(this, 'periodeId', periodeId);
    RealmObjectBase.set(this, 'periodeLibelleLongLt', periodeLibelleLongLt);
  }

  Section._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get dateAffectation =>
      RealmObjectBase.get<String>(this, 'dateAffectation') as String;
  @override
  set dateAffectation(String value) =>
      RealmObjectBase.set(this, 'dateAffectation', value);

  @override
  int get groupePedagogiqueId =>
      RealmObjectBase.get<int>(this, 'groupePedagogiqueId') as int;
  @override
  set groupePedagogiqueId(int value) =>
      RealmObjectBase.set(this, 'groupePedagogiqueId', value);

  @override
  String get nomGroupePedagogique =>
      RealmObjectBase.get<String>(this, 'nomGroupePedagogique') as String;
  @override
  set nomGroupePedagogique(String value) =>
      RealmObjectBase.set(this, 'nomGroupePedagogique', value);

  @override
  String get nomSection =>
      RealmObjectBase.get<String>(this, 'nomSection') as String;
  @override
  set nomSection(String value) =>
      RealmObjectBase.set(this, 'nomSection', value);

  @override
  String get periodeCode =>
      RealmObjectBase.get<String>(this, 'periodeCode') as String;
  @override
  set periodeCode(String value) =>
      RealmObjectBase.set(this, 'periodeCode', value);

  @override
  int get periodeId => RealmObjectBase.get<int>(this, 'periodeId') as int;
  @override
  set periodeId(int value) => RealmObjectBase.set(this, 'periodeId', value);

  @override
  String get periodeLibelleLongLt =>
      RealmObjectBase.get<String>(this, 'periodeLibelleLongLt') as String;
  @override
  set periodeLibelleLongLt(String value) =>
      RealmObjectBase.set(this, 'periodeLibelleLongLt', value);

  @override
  Stream<RealmObjectChanges<Section>> get changes =>
      RealmObjectBase.getChanges<Section>(this);

  @override
  Section freeze() => RealmObjectBase.freezeObject<Section>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Section._);
    return const SchemaObject(ObjectType.realmObject, Section, 'Section', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('dateAffectation', RealmPropertyType.string),
      SchemaProperty('groupePedagogiqueId', RealmPropertyType.int),
      SchemaProperty('nomGroupePedagogique', RealmPropertyType.string),
      SchemaProperty('nomSection', RealmPropertyType.string),
      SchemaProperty('periodeCode', RealmPropertyType.string),
      SchemaProperty('periodeId', RealmPropertyType.int),
      SchemaProperty('periodeLibelleLongLt', RealmPropertyType.string),
    ]);
  }
}
