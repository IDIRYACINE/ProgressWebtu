import 'package:progresswebtu/core/api/feature.dart';

class SectionModel {
  final String dateAffectation;
  final int groupePedagogiqueId;
  final int id;
  final String nomGroupePedagogique;
  final String nomSection;
  final String periodeCode;
  final int periodeId;
  final String periodeLibelleLongLt;

  SectionModel(
      {required this.dateAffectation,
      required this.groupePedagogiqueId,
      required this.id,
      required this.nomGroupePedagogique,
      required this.nomSection,
      required this.periodeCode,
      required this.periodeId,
      required this.periodeLibelleLongLt});

  factory SectionModel.fromSectionApi(Section apiSection) {
    return SectionModel(
        dateAffectation: apiSection.dateAffectation,
        groupePedagogiqueId: apiSection.groupePedagogiqueId,
        id: apiSection.id,
        nomGroupePedagogique: apiSection.nomGroupePedagogique,
        nomSection: apiSection.nomSection,
        periodeCode: apiSection.periodeCode,
        periodeId: apiSection.periodeId,
        periodeLibelleLongLt: apiSection.periodeLibelleLongLt);
  }
}

class StudentCardModel {
  final String anneeAcademiqueCode;
  final int anneeAcademiqueId;
  final String cycleCode;
  final int cycleId;
  final String cycleLibelleLongLt;
  final int dossierEtudiantId;
  final int id;
  final DateTime individuDateNaissance;
  final int individuId;
  final String individuLieuNaissance;
  final String individuLieuNaissanceArabe;
  final String individuNomArabe;
  final String individuNomLatin;
  final String individuPrenomArabe;
  final String individuPrenomLatin;
  final double lastMoyenne;
  final String llEtablissementArabe;
  final String llEtablissementLatin;
  final double moyenneBac;
  final String nin;
  final String niveauCode;
  final int niveauId;
  final String niveauLibelleLongAr;
  final String niveauLibelleLongLt;
  final int niveauRang;
  final String numeroInscription;
  final String numeroMatricule;
  final String ofCodeDomaine;
  final String ofCodeFiliere;
  final String ofCodeSpecialite;
  final int ofIdDomaine;
  final int ofIdFiliere;
  final int ofIdSpecialite;
  final String ofLlDomaine;
  final String ofLlDomaineArabe;
  final String ofLlFiliere;
  final String ofLlFiliereArabe;
  final String ofLlSpecialite;
  final String ofLlSpecialiteArabe;
  final int ouvertureOffreFormationId;
  final String photo;
  final String refCodeCycle;
  final String refCodeEtablissement;
  final String refLibelleCycle;
  final String refLibelleCycleAr;

  StudentCardModel({
    required this.anneeAcademiqueCode,
    required this.anneeAcademiqueId,
    required this.cycleCode,
    required this.cycleId,
    required this.cycleLibelleLongLt,
    required this.dossierEtudiantId,
    required this.id,
    required this.individuDateNaissance,
    required this.individuId,
    required this.individuLieuNaissance,
    required this.individuLieuNaissanceArabe,
    required this.individuNomArabe,
    required this.individuNomLatin,
    required this.individuPrenomArabe,
    required this.individuPrenomLatin,
    required this.lastMoyenne,
    required this.llEtablissementArabe,
    required this.llEtablissementLatin,
    required this.moyenneBac,
    required this.nin,
    required this.niveauCode,
    required this.niveauId,
    required this.niveauLibelleLongLt,
    required this.niveauLibelleLongAr,
    required this.niveauRang,
    required this.numeroInscription,
    required this.numeroMatricule,
    required this.ofCodeDomaine,
    required this.ofCodeFiliere,
    required this.ofCodeSpecialite,
    required this.ofIdDomaine,
    required this.ofIdFiliere,
    required this.ofIdSpecialite,
    required this.ofLlDomaine,
    required this.ofLlDomaineArabe,
    required this.ofLlFiliere,
    required this.ofLlFiliereArabe,
    required this.ofLlSpecialite,
    required this.ofLlSpecialiteArabe,
    required this.ouvertureOffreFormationId,
    required this.photo,
    required this.refCodeCycle,
    required this.refCodeEtablissement,
    required this.refLibelleCycle,
    required this.refLibelleCycleAr,
  });

  factory StudentCardModel.fromApiResponse(StudentCardSection cardSection) {
    return StudentCardModel(
      anneeAcademiqueCode: cardSection.anneeAcademiqueCode,
      anneeAcademiqueId: cardSection.anneeAcademiqueId,
      cycleCode: cardSection.cycleCode,
      cycleId: cardSection.cycleId,
      cycleLibelleLongLt: cardSection.cycleLibelleLongLt,
      dossierEtudiantId: cardSection.dossierEtudiantId,
      id: cardSection.id,
      individuDateNaissance: cardSection.individuDateNaissance,
      individuId: cardSection.individuId,
      individuLieuNaissance: cardSection.individuLieuNaissance,
      individuLieuNaissanceArabe: cardSection.individuLieuNaissanceArabe,
      individuNomArabe: cardSection.individuNomArabe,
      individuNomLatin: cardSection.individuNomLatin,
      individuPrenomArabe: cardSection.individuPrenomArabe,
      individuPrenomLatin: cardSection.individuPrenomLatin,
      lastMoyenne: cardSection.lastMoyenne,
      llEtablissementArabe: cardSection.llEtablissementArabe,
      llEtablissementLatin: cardSection.llEtablissementLatin,
      moyenneBac: cardSection.moyenneBac,
      nin: cardSection.nin,
      niveauCode: cardSection.niveauCode,
      niveauId: cardSection.niveauId,
      niveauLibelleLongLt: cardSection.niveauLibelleLongLt,
      niveauLibelleLongAr: cardSection.niveauLibelleLongAr,
      niveauRang: cardSection.niveauRang,
      numeroInscription: cardSection.numeroInscription,
      numeroMatricule: cardSection.numeroMatricule,
      ofCodeDomaine: cardSection.ofCodeDomaine,
      ofCodeFiliere: cardSection.ofCodeFiliere,
      ofCodeSpecialite: cardSection.ofCodeSpecialite,
      ofIdDomaine: cardSection.ofIdDomaine,
      ofIdFiliere: cardSection.ofIdFiliere,
      ofIdSpecialite: cardSection.ofIdSpecialite,
      ofLlDomaine: cardSection.ofLlDomaine,
      ofLlDomaineArabe: cardSection.ofLlDomaineArabe,
      ofLlFiliere: cardSection.ofLlFiliere,
      ofLlFiliereArabe: cardSection.ofLlFiliereArabe,
      ofLlSpecialite: cardSection.ofLlSpecialite,
      ofLlSpecialiteArabe: cardSection.ofLlSpecialiteArabe,
      ouvertureOffreFormationId: cardSection.ouvertureOffreFormationId,
      photo: cardSection.photo,
      refCodeCycle: cardSection.refCodeCycle,
      refCodeEtablissement: cardSection.refCodeEtablissement,
      refLibelleCycle: cardSection.refLibelleCycle,
      refLibelleCycleAr: cardSection.refLibelleCycleAr,
    );
  }
}
