
enum SessionBilanKey {
  id,
  type,
  periodeId,
  periodeLibelleFr,
  periodeLibelleAr,
  bilanUes,
  moyenne,
  moyenneSn,
  credit,
  creditObtenu,
  creditAcquis,
  annuel,
  cycleLibelleLongLt,
  niveauCode,
  niveauRang,
  niveauLibelleLongLt,
  totalAquis,
  effectif,
  coefficient
}

class SessionBilan {
  final int id;
  final int type;
  final int periodeId;
  final String periodeLibelleFr;
  final String periodeLibelleAr;
  final List<BilanUe> bilanUes;
  final double moyenne;
  final double moyenneSn;
  final double credit;
  final double creditObtenu;
  final double creditAcquis;
  final bool annuel;
  final String cycleLibelleLongLt;
  final String niveauCode;
  final int niveauRang;
  final String niveauLibelleLongLt;
  final int totalAquis;
  final int effectif;
  final double coefficient;

  SessionBilan({
    required this.id,
    required this.type,
    required this.periodeId,
    required this.periodeLibelleFr,
    required this.periodeLibelleAr,
    required this.bilanUes,
    required this.moyenne,
    required this.moyenneSn,
    required this.credit,
    required this.creditObtenu,
    required this.creditAcquis,
    required this.annuel,
    required this.cycleLibelleLongLt,
    required this.niveauCode,
    required this.niveauRang,
    required this.niveauLibelleLongLt,
    required this.totalAquis,
    required this.effectif,
    required this.coefficient,
  });

  factory SessionBilan.fromJson(Map<String, dynamic> json) {
    return SessionBilan(
      id: json[SessionBilanKey.id.toString()] as int,
      type: json[SessionBilanKey.type.toString()] as int,
      periodeId: json[SessionBilanKey.periodeId.toString()] as int,
      periodeLibelleFr: json[SessionBilanKey.periodeLibelleFr.toString()] as String,
      periodeLibelleAr: json[SessionBilanKey.periodeLibelleAr.toString()] as String,
      bilanUes: (json[SessionBilanKey.bilanUes.toString()] as List<dynamic>)
          .map((e) => BilanUe.fromJson(e as Map<String, dynamic>))
          .toList(),
      moyenne: json[SessionBilanKey.moyenne.toString()] as double,
      moyenneSn: json[SessionBilanKey.moyenneSn.toString()] as double,
      credit: json[SessionBilanKey.credit.toString()] as double,
      creditObtenu: json[SessionBilanKey.creditObtenu.toString()] as double,
      creditAcquis: json[SessionBilanKey.creditAcquis.toString()] as double,
      annuel: json[SessionBilanKey.annuel.toString()] as bool,
      cycleLibelleLongLt: json[SessionBilanKey.cycleLibelleLongLt.toString()] as String,
      niveauCode: json[SessionBilanKey.niveauCode.toString()] as String,
      niveauRang: json[SessionBilanKey.niveauRang.toString()] as int,
      niveauLibelleLongLt: json[SessionBilanKey.niveauLibelleLongLt.toString()] as String,
      totalAquis: json[SessionBilanKey.totalAquis.toString()] as int,
      effectif: json[SessionBilanKey.effectif.toString()] as int,
      coefficient: json[SessionBilanKey.coefficient.toString()] as double,
    );
  }

}

enum BilanMcKey{
  id,
  bilanUeId,
  bilanSessionId,
  rattachementMcId,
  mcLibelleFr,
  mcCode,
  moyenneControleContinu,
  coefficient,
  credit,
  creditObtenu,
  coefficientControleContinu,
  coefficientExamen,
  noteExamen,
  noteJury,
  moyenneGenerale,
  totalAquis,
  effectif,
  nbrEtudiantAmeliorerNoteSession2
}

class BilanMc {
  final int id;
  final int bilanUeId;
  final int bilanSessionId;
  final int rattachementMcId;
  final String mcLibelleFr;
  final String mcCode;
  final double moyenneControleContinu;
  final double coefficient;
  final double credit;
  final double creditObtenu;
  final double coefficientControleContinu;
  final double coefficientExamen;
  final double noteExamen;
  final double noteJury;
  final double moyenneGenerale;
  final int totalAquis;
  final int effectif;
  final int nbrEtudiantAmeliorerNoteSession2;

  const BilanMc({
    required this.id,
    required this.bilanUeId,
    required this.bilanSessionId,
    required this.rattachementMcId,
    required this.mcLibelleFr,
    required this.mcCode,
    required this.moyenneControleContinu,
    required this.coefficient,
    required this.credit,
    required this.creditObtenu,
    required this.coefficientControleContinu,
    required this.coefficientExamen,
    required this.noteExamen,
    required this.noteJury,
    required this.moyenneGenerale,
    required this.totalAquis,
    required this.effectif,
    required this.nbrEtudiantAmeliorerNoteSession2,
  });

  factory BilanMc.fromJson(Map<String, dynamic> json) {
    return BilanMc(
      id: json[BilanMcKey.id.toString()] as int,
      bilanUeId: json[BilanMcKey.bilanUeId.toString()] as int,
      bilanSessionId: json[BilanMcKey.bilanSessionId.toString()] as int,
      rattachementMcId: json[BilanMcKey.rattachementMcId.toString()] as int,
      mcLibelleFr: json[BilanMcKey.mcLibelleFr.toString()] as String,
      mcCode: json[BilanMcKey.mcCode.toString()] as String,
      moyenneControleContinu: json[BilanMcKey.moyenneControleContinu.toString()] as double,
      coefficient: json[BilanMcKey.coefficient.toString()] as double,
      credit: json[BilanMcKey.credit.toString()] as double,
      creditObtenu: json[BilanMcKey.creditObtenu.toString()] as double,
      coefficientControleContinu: json[BilanMcKey.coefficientControleContinu.toString()] as double,
      coefficientExamen: json[BilanMcKey.coefficientExamen.toString()] as double,
      noteExamen: json[BilanMcKey.noteExamen.toString()] as double,
      noteJury: json[BilanMcKey.noteJury.toString()] as double,
      moyenneGenerale: json[BilanMcKey.moyenneGenerale.toString()] as double,
      totalAquis: json[BilanMcKey.totalAquis.toString()] as int,
      effectif: json[BilanMcKey.effectif.toString()] as int,
      nbrEtudiantAmeliorerNoteSession2: json[BilanMcKey.nbrEtudiantAmeliorerNoteSession2.toString()] as int,
    );
  }

}

enum BilanUeKey{
  id,
  bilanSessionId,
  repartitionUeId,
  ueLibelleFr,
  ueCode,
  ueType,
  moyenne,
  coefficient,
  credit,
  creditObtenu,
  creditAcquis,
  ueNatureLlFr,
  ueNatureLlAr,
  ueNatureLcFr,
  ueNatureLcAr,
  ueNatureCode,
  bilanMcs,
  ueNoteObtention,
  ueAcquis,
  totalAquis,
  effectif
}

class BilanUe {
  final int id;
  final int bilanSessionId;
  final int repartitionUeId;
  final String ueLibelleFr;
  final String ueCode;
  final String ueType;
  final double moyenne;
  final double coefficient;
  final double credit;
  final double creditObtenu;
  final double creditAcquis;
  final String ueNatureLlFr;
  final String ueNatureLlAr;
  final String ueNatureLcFr;
  final String ueNatureLcAr;
  final String ueNatureCode;
  final List<BilanMc> bilanMcs;
  final double ueNoteObtention;
  final bool ueAcquis;
  final int totalAquis;
  final int effectif;

  const BilanUe({
    required this.id,
    required this.bilanSessionId,
    required this.repartitionUeId,
    required this.ueLibelleFr,
    required this.ueCode,
    required this.ueType,
    required this.moyenne,
    required this.coefficient,
    required this.credit,
    required this.creditObtenu,
    required this.creditAcquis,
    required this.ueNatureLlFr,
    required this.ueNatureLlAr,
    required this.ueNatureLcFr,
    required this.ueNatureLcAr,
    required this.ueNatureCode,
    required this.bilanMcs,
    required this.ueNoteObtention,
    required this.ueAcquis,
    required this.totalAquis,
    required this.effectif,
  });

  factory BilanUe.fromJson(Map<String, dynamic> json) {
    return BilanUe(
      id: json[BilanUeKey.id],
      bilanSessionId: json[BilanUeKey.bilanSessionId],
      repartitionUeId: json[BilanUeKey.repartitionUeId],
      ueLibelleFr: json[BilanUeKey.ueLibelleFr],
      ueCode: json[BilanUeKey.ueCode],
      ueType: json[BilanUeKey.ueType],
      moyenne: json[BilanUeKey.moyenne],
      coefficient: json[BilanUeKey.coefficient],
      credit: json[BilanUeKey.credit],
      creditObtenu: json[BilanUeKey.creditObtenu],
      creditAcquis: json[BilanUeKey.creditAcquis],
      ueNatureLlFr: json[BilanUeKey.ueNatureLlFr],
      ueNatureLlAr: json[BilanUeKey.ueNatureLlAr],
      ueNatureLcFr: json[BilanUeKey.ueNatureLcFr],
      ueNatureLcAr: json[BilanUeKey.ueNatureLcAr],
      ueNatureCode: json[BilanUeKey.ueNatureCode],
      bilanMcs:  json[BilanUeKey.bilanMcs] != null ? (json[BilanUeKey.bilanMcs] as List).map((e) => BilanMc.fromJson(e)).toList() : [],
      ueNoteObtention: json[BilanUeKey.ueNoteObtention],
      ueAcquis: json[BilanUeKey.ueAcquis],
      totalAquis: json[BilanUeKey.totalAquis],
      effectif: json[BilanUeKey.effectif],
    );
  }
}