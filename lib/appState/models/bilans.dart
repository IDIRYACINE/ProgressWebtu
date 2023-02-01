
import 'package:progresswebtu/core/api/commands/allSessionsBilans/models.dart';

class SessionBilanModel {
  final int id;
  final int type;
  final int periodeId;
  final String periodeLibelleFr;
  final String periodeLibelleAr;
  final List<BilanUeModel> bilanUes;
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

  SessionBilanModel({
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

  factory SessionBilanModel.fromApi(SessionBilan bilan){
    return SessionBilanModel(
      id: bilan.id,
      type: bilan.type,
      periodeId: bilan.periodeId,
      periodeLibelleFr: bilan.periodeLibelleFr,
      periodeLibelleAr: bilan.periodeLibelleAr,
      bilanUes: List<BilanUeModel>.from(bilan.bilanUes.map((e) => BilanUeModel.fromApi(e))),
      moyenne: bilan.moyenne,
      moyenneSn: bilan.moyenneSn,
      credit: bilan.credit,
      creditObtenu: bilan.creditObtenu,
      creditAcquis: bilan.creditAcquis,
      annuel: bilan.annuel,
      cycleLibelleLongLt: bilan.cycleLibelleLongLt,
      niveauCode: bilan.niveauCode,
      niveauRang: bilan.niveauRang,
      niveauLibelleLongLt: bilan.niveauLibelleLongLt,
      totalAquis: bilan.totalAquis,
      effectif: bilan.effectif,
      coefficient: bilan.coefficient,
    );
  }


}

class BilanMcModel {
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

  const BilanMcModel({
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

  factory BilanMcModel.fromApi(BilanMc mc){
    return BilanMcModel(
      id: mc.id,
      bilanUeId: mc.bilanUeId,
      bilanSessionId: mc.bilanSessionId,
      rattachementMcId: mc.rattachementMcId,
      mcLibelleFr: mc.mcLibelleFr,
      mcCode: mc.mcCode,
      moyenneControleContinu: mc.moyenneControleContinu,
      coefficient: mc.coefficient,
      credit: mc.credit,
      creditObtenu: mc.creditObtenu,
      coefficientControleContinu: mc.coefficientControleContinu,
      coefficientExamen: mc.coefficientExamen,
      noteExamen: mc.noteExamen,
      noteJury: mc.noteJury,
      moyenneGenerale: mc.moyenneGenerale,
      totalAquis: mc.totalAquis,
      effectif: mc.effectif,
      nbrEtudiantAmeliorerNoteSession2: mc.nbrEtudiantAmeliorerNoteSession2,
    );
  }

}


class BilanUeModel {
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
  final List<BilanMcModel> bilanMcs;
  final double ueNoteObtention;
  final bool ueAcquis;
  final double totalAquis;
  final double effectif;

  const BilanUeModel({
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
  
  factory BilanUeModel.fromApi(BilanUe ue){
    return BilanUeModel(
      id: ue.id,
      bilanSessionId: ue.bilanSessionId,
      repartitionUeId: ue.repartitionUeId,
      ueLibelleFr: ue.ueLibelleFr,
      ueCode: ue.ueCode,
      ueType: ue.ueType,
      moyenne: ue.moyenne,
      coefficient: ue.coefficient,
      credit: ue.credit,
      creditObtenu: ue.creditObtenu,
      creditAcquis: ue.creditAcquis,
      ueNatureLlFr: ue.ueNatureLlFr,
      ueNatureLlAr: ue.ueNatureLlAr,
      ueNatureLcFr: ue.ueNatureLcFr,
      ueNatureLcAr: ue.ueNatureLcAr,
      ueNatureCode: ue.ueNatureCode,
      bilanMcs: List<BilanMcModel>.from(ue.bilanMcs.map((e) => BilanMcModel.fromApi(e))),
      ueNoteObtention: ue.ueNoteObtention,
      ueAcquis: ue.ueAcquis,
      totalAquis: ue.totalAquis,
      effectif: ue.effectif,
    );
  }

}