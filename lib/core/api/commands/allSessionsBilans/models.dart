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
  final double totalAquis;
  final double effectif;
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
    
    final bilansUe = List<BilanUe>.from(
        (json[SessionBilanKey.bilanUes.name] ?? [])
            .map((e) => BilanUe.fromJson(e as Map<String, dynamic>)));

    return SessionBilan(
      id: json[SessionBilanKey.id.name] ?? 0,
      type: json[SessionBilanKey.type.name] ?? 0,
      periodeId: json[SessionBilanKey.periodeId.name] ?? 0,
      periodeLibelleFr: json[SessionBilanKey.periodeLibelleFr.name] ?? "",
      periodeLibelleAr: json[SessionBilanKey.periodeLibelleAr.name] ?? "",
      bilanUes: bilansUe,
      moyenne: (json[SessionBilanKey.moyenne.name] ?? 0).toDouble(),
      moyenneSn: (json[SessionBilanKey.moyenneSn.name] ?? 0).toDouble(),
      credit: (json[SessionBilanKey.credit.name] ?? 0).toDouble(),
      creditObtenu:
          (json[SessionBilanKey.creditObtenu.name] ?? 0).toDouble(),
      creditAcquis:
          (json[SessionBilanKey.creditAcquis.name] ?? 0).toDouble(),
      annuel: json[SessionBilanKey.annuel.name] ?? false,
      cycleLibelleLongLt:
          json[SessionBilanKey.cycleLibelleLongLt.name] ?? "",
      niveauCode: json[SessionBilanKey.niveauCode.name] ?? "",
      niveauRang: json[SessionBilanKey.niveauRang.name] ?? 0,
      niveauLibelleLongLt:
          json[SessionBilanKey.niveauLibelleLongLt.name] ?? "",
      totalAquis: (json[SessionBilanKey.totalAquis.name] ?? 0).toDouble(),
      effectif: (json[SessionBilanKey.effectif.name] ?? 0).toDouble(),
      coefficient:
          (json[SessionBilanKey.coefficient.name] ?? 0).toDouble(),
    );
  }
}

enum BilanMcKey {
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
  final double totalAquis;
  final double effectif;
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
      id: json[BilanMcKey.id.name] ?? 0,
      bilanUeId: json[BilanMcKey.bilanUeId.name] ?? 0,
      bilanSessionId: json[BilanMcKey.bilanSessionId.name] ?? 0,
      rattachementMcId: json[BilanMcKey.rattachementMcId.name] ?? 0,
      mcLibelleFr: json[BilanMcKey.mcLibelleFr.name] ?? "",
      mcCode: json[BilanMcKey.mcCode.name] ?? "",
      moyenneControleContinu:
          (json[BilanMcKey.moyenneControleContinu.name] ?? 0).toDouble(),
      coefficient: (json[BilanMcKey.coefficient.name] ?? 0).toDouble(),
      credit: (json[BilanMcKey.credit.name] ?? 0).toDouble(),
      creditObtenu: (json[BilanMcKey.creditObtenu.name] ?? 0).toDouble(),
      coefficientControleContinu:
          (json[BilanMcKey.coefficientControleContinu.name] ?? 0)
              .toDouble(),
      coefficientExamen:
          (json[BilanMcKey.coefficientExamen.name] ?? 0).toDouble(),
      noteExamen: (json[BilanMcKey.noteExamen.name] ?? 0).toDouble(),
      noteJury: (json[BilanMcKey.noteJury.name] ?? 0).toDouble(),
      moyenneGenerale:
          (json[BilanMcKey.moyenneGenerale.name] ?? 0).toDouble(),
      totalAquis: (json[BilanMcKey.totalAquis.name] ?? 0).toDouble(),
      effectif: (json[BilanMcKey.effectif.name] ?? 0).toDouble(),
      nbrEtudiantAmeliorerNoteSession2:
          json[BilanMcKey.nbrEtudiantAmeliorerNoteSession2.name] ?? 0,
    );
  }
}

enum BilanUeKey {
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
  final double totalAquis;
  final double effectif;

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
    final bilanMcs = List<BilanMc>.from(
        (json[BilanUeKey.bilanMcs.name] ?? []).map((e) => BilanMc.fromJson(e)));

    return BilanUe(
      id: json[BilanUeKey.id.name] ?? 0,
      bilanSessionId: json[BilanUeKey.bilanSessionId.name] ?? 0,
      repartitionUeId: json[BilanUeKey.repartitionUeId.name] ?? 0,
      ueLibelleFr: json[BilanUeKey.ueLibelleFr.name] ?? "",
      ueCode: json[BilanUeKey.ueCode.name] ?? "",
      ueType: json[BilanUeKey.ueType.name] ?? "",
      moyenne: (json[BilanUeKey.moyenne.name] ?? 0).toDouble(),
      coefficient: (json[BilanUeKey.coefficient.name]?? 0).toDouble(),
      credit: (json[BilanUeKey.credit.name] ?? 0).toDouble(),
      creditObtenu: (json[BilanUeKey.creditObtenu.name] ?? 0).toDouble(),
      creditAcquis: (json[BilanUeKey.creditAcquis.name] ?? 0).toDouble(),
      ueNatureLlFr: json[BilanUeKey.ueNatureLlFr.name] ?? "",
      ueNatureLlAr: json[BilanUeKey.ueNatureLlAr.name] ?? "",
      ueNatureLcFr: json[BilanUeKey.ueNatureLcFr.name] ?? "",
      ueNatureLcAr: json[BilanUeKey.ueNatureLcAr.name] ?? "",
      ueNatureCode: json[BilanUeKey.ueNatureCode.name] ?? "",
      bilanMcs: bilanMcs,
      ueNoteObtention: (json[BilanUeKey.ueNoteObtention.name] ?? 0).toDouble(),
      ueAcquis: json[BilanUeKey.ueAcquis.name] ?? false,
      totalAquis: (json[BilanUeKey.totalAquis.name] ?? 0).toDouble(),
      effectif: (json[BilanUeKey.effectif.name] ?? 0).toDouble(),
    );
  }
}
