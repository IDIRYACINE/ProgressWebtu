import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int allAcademicYearEventId = Apis.dias.index;
final String allAcademicYearEventName = Apis.dias.name;

class AcademicYearAllCommand extends Command<AcademicYearAllEventData,
    AcademicYearAllRawEventData, AcademicYearAllResponse> {
  AcademicYearAllCommand() : super(allAcademicYearEventId, allAcademicYearEventName);

  @override
  Future<AcademicYearAllResponse> handleEvent(
      AcademicYearAllEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<AcademicYearAllResponse> handleRawEvent(
      AcademicYearAllRawEventData eventData) {
    Api api = AllAcademicYearsApi();

    String apiUrl = api.url.replaceAll(usernameToken, eventData.username);
    apiUrl = apiUrl.replaceAll(bacYearToken, eventData.bacYear);

    Uri url = Uri.https(host, apiUrl);

    final headers = {"authorization": eventData.authKey};

    return ApiService.instance()
        .client
        .get(url, headers: headers)
        .then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<AcademicYear> academicYears = decodedResponse
            .map((e) => AcademicYear.fromJson(e as Map<String, dynamic>))
            .toList();

        AcademicYearAllResponse academicYearAllResponse =
            AcademicYearAllResponse(
                messageId: eventData.messageId, academicYearAll: academicYears);
        return academicYearAllResponse;
      } catch (e) {
        return AcademicYearAllResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class AcademicYearAllEventData
    extends ServiceEventData<AcademicYearAllRawEventData> {
  final String username;

  final String bacYear;

  final String authKey;
  AcademicYearAllEventData({
    required this.username,
    required this.bacYear,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  AcademicYearAllRawEventData toRawServiceEventData() {
    return AcademicYearAllRawEventData(
        authKey: authKey,
        bacYear: bacYear,
        username: username,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class AcademicYearAllRawEventData extends RawServiceEventData {
  final String username;

  final String bacYear;

  final String authKey;

  AcademicYearAllRawEventData(
      {required this.username,
      required this.bacYear,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.dias.index);
}

class AcademicYearAllResponse extends ServiceEventResponse {
  final List<AcademicYear>? academicYearAll;

  AcademicYearAllResponse({
    this.academicYearAll,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum AcademicYearKey {
  anneeAcademiqueCode,
  anneeAcademiqueId,
  cycleCode,
  cycleId,
  cycleLibelleLongLt,
  dossierEtudiantId,
  id,
  individuDateNaissance,
  individuId,
  individuLieuNaissance,
  individuLieuNaissanceArabe,
  individuNomArabe,
  individuNomLatin,
  individuPrenomArabe,
  individuPrenomLatin,
  lastMoyenne,
  llEtablissementArabe,
  llEtablissementLatin,
  moyenneBac,
  nin,
  niveauCode,
  niveauId,
  niveauLibelleLongAr,
  niveauLibelleLongLt,
  niveauRang,
  numeroInscription,
  numeroMatricule,
  ofCodeDomaine,
  ofCodeFiliere,
  ofCodeSpecialite,
  ofIdDomaine,
  ofIdFiliere,
  ofIdSpecialite,
  ofLlDomaine,
  ofLlDomaineArabe,
  ofLlFiliere,
  ofLlFiliereArabe,
  ofLlSpecialite,
  ofLlSpecialiteArabe,
  ouvertureOffreFormationId,
  photo,
  refCodeCycle,
  refCodeEtablissement,
  refLibelleCycle,
  refLibelleCycleAr,
}

class AcademicYear {
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

  AcademicYear({
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
    required this.niveauLibelleLongAr,
    required this.niveauLibelleLongLt,
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
    required this.refCodeEtablissement,
    required this.refLibelleCycle,
    required this.refLibelleCycleAr,
    required this.refCodeCycle,
  });

  factory AcademicYear.fromJson(Map<String, dynamic> json) {
    return AcademicYear(
      anneeAcademiqueCode: json[AcademicYearKey.anneeAcademiqueCode.name],
      anneeAcademiqueId: json[AcademicYearKey.anneeAcademiqueId.name],
      cycleCode: json[AcademicYearKey.cycleCode.name],
      cycleId: json[AcademicYearKey.cycleId.name],
      cycleLibelleLongLt: json[AcademicYearKey.cycleLibelleLongLt.name],
      dossierEtudiantId: json[AcademicYearKey.dossierEtudiantId.name],
      id: json[AcademicYearKey.id.name],
      individuDateNaissance: json[AcademicYearKey.individuDateNaissance.name],
      individuId: json[AcademicYearKey.individuId.name],
      individuLieuNaissance: json[AcademicYearKey.individuLieuNaissance.name],
      individuLieuNaissanceArabe:
          json[AcademicYearKey.individuLieuNaissanceArabe.name],
      individuNomArabe: json[AcademicYearKey.individuNomArabe.name],
      individuNomLatin: json[AcademicYearKey.individuNomLatin.name],
      individuPrenomArabe: json[AcademicYearKey.individuPrenomArabe.name],
      individuPrenomLatin: json[AcademicYearKey.individuPrenomLatin.name],
      lastMoyenne: json[AcademicYearKey.lastMoyenne.name],
      llEtablissementArabe: json[AcademicYearKey.llEtablissementArabe.name],
      llEtablissementLatin: json[AcademicYearKey.llEtablissementLatin.name],
      moyenneBac: json[AcademicYearKey.moyenneBac.name],
      nin: json[AcademicYearKey.nin.name],
      niveauCode: json[AcademicYearKey.niveauCode.name],
      niveauId: json[AcademicYearKey.niveauId.name],
      niveauLibelleLongAr: json[AcademicYearKey.niveauLibelleLongAr.name],
      niveauLibelleLongLt: json[AcademicYearKey.niveauLibelleLongLt.name],
      niveauRang: json[AcademicYearKey.niveauRang.name],
      numeroInscription: json[AcademicYearKey.numeroInscription.name],
      numeroMatricule: json[AcademicYearKey.numeroMatricule.name],
      ofCodeDomaine: json[AcademicYearKey.ofCodeDomaine.name],
      ofCodeFiliere: json[AcademicYearKey.ofCodeFiliere.name],
      ofCodeSpecialite: json[AcademicYearKey.ofCodeSpecialite.name],
      ofIdDomaine: json[AcademicYearKey.ofIdDomaine.name],
      ofIdFiliere: json[AcademicYearKey.ofIdFiliere.name],
      ofIdSpecialite: json[AcademicYearKey.ofIdSpecialite.name],
      ofLlDomaine: json[AcademicYearKey.ofLlDomaine.name],
      ofLlDomaineArabe: json[AcademicYearKey.ofLlDomaineArabe.name],
      ofLlFiliere: json[AcademicYearKey.ofLlFiliere.name],
      ofLlFiliereArabe: json[AcademicYearKey.ofLlFiliereArabe.name],
      ofLlSpecialite: json[AcademicYearKey.ofLlSpecialite.name],
      ofLlSpecialiteArabe: json[AcademicYearKey.ofLlSpecialiteArabe.name],
      ouvertureOffreFormationId:
          json[AcademicYearKey.ouvertureOffreFormationId.name],
      photo: json[AcademicYearKey.photo.name],
      refCodeEtablissement: json[AcademicYearKey.refCodeEtablissement.name],
      refLibelleCycle: json[AcademicYearKey.refLibelleCycle.name],
      refLibelleCycleAr: json[AcademicYearKey.refLibelleCycleAr.name],
      refCodeCycle: json[AcademicYearKey.refCodeCycle.name],
    );
  }
}

class AcademicYearEvent extends ServiceEvent<AcademicYearAllResponse>{
  AcademicYearEvent({required super.eventData,super.callback}) : super(allAcademicYearEventId, allAcademicYearEventName, serviceId);
}
