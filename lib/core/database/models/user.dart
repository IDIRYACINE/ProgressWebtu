import 'package:realm/realm.dart';

part 'user.g.dart';

@RealmModel()
class _BacSummary {
  late String anneeBac;
  late String dateNaissance;
  late int id;
  late String libelleSerieBac;
  late String matricule;
  late String moyenneBac;
  late double moyenneGeneraleBac;
  late String nin;
  late String nomAr;
  late String nomFr;
  late String prenomAr;
  late String prenomFr;
  late String refCodeSerieBac;
  late String refCodeWilayaBac;

  late List<_BacNote> bacNotes;
}

@RealmModel()
class _BacNote {
  late double note;
  late String refCodeMatiere;
}

@RealmModel()
class _AppUser {
  @PrimaryKey()
  late String username;

  late String password;
  late String authKey;
  late String authKeyExpiration;
}


@RealmModel()
class _Section {
  @PrimaryKey()
  late int id;

  late String dateAffectation;
  late int groupePedagogiqueId;
  late String nomGroupePedagogique;
  late String nomSection;
  late String periodeCode;
  late int periodeId;
  late String periodeLibelleLongLt;
}