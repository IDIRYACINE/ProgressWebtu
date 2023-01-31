import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int studentCardEventId = Apis.dias.index;
final String studentCardEventName = Apis.dias.name;

class StudentCardCommand extends Command<StudentCardEventData,
    StudentCardRawEventData, StudentCardResponse> {
  final Map<String, String> _headers;

  StudentCardCommand([this._headers = const {}])
      : super(studentCardEventId, studentCardEventName);

  @override
  Future<StudentCardResponse> handleEvent(StudentCardEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<StudentCardResponse> handleRawEvent(
      StudentCardRawEventData eventData) {
    Api api = StudentCardApi();

    String apiUrl = api.url.replaceAll(usernameToken, eventData.username);
    apiUrl = apiUrl.replaceAll(bacYearToken, eventData.bacYear);

    Uri url = Uri.https(host, apiUrl);

    _headers.putIfAbsent("authorization", () => eventData.authKey);

    return ApiService.instance()
        .client
        .get(url, headers: _headers)
        .then((response) {
      try {
        final decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<StudentCardSection> studentCardSections = decodedResponse
            .map((e) => StudentCardSection.fromJson(e as Map<String, dynamic>))
            .toList();

        return StudentCardResponse(
            messageId: eventData.messageId, studentCard: studentCardSections);
      } catch (e) {
        return StudentCardResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class StudentCardEventData extends ServiceEventData<StudentCardRawEventData> {
  final String username;

  final String bacYear;

  final String authKey;
  StudentCardEventData({
    required this.username,
    required this.bacYear,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  StudentCardRawEventData toRawServiceEventData() {
    return StudentCardRawEventData(
        authKey: authKey,
        bacYear: bacYear,
        username: username,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class StudentCardRawEventData extends RawServiceEventData {
  final String username;

  final String bacYear;

  final String authKey;

  StudentCardRawEventData(
      {required this.username,
      required this.bacYear,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.dias.index);
}

class StudentCardResponse extends ServiceEventResponse {
  final List<StudentCardSection>? studentCard;

  StudentCardResponse({
    this.studentCard,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum CardSectionKey {
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

class StudentCardSection {
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

  StudentCardSection({
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

  factory StudentCardSection.fromJson(Map<String, dynamic> json) {

    return StudentCardSection(
      anneeAcademiqueCode: json[CardSectionKey.anneeAcademiqueCode.name] ?? '',
      anneeAcademiqueId: json[CardSectionKey.anneeAcademiqueId.name] ?? 0,
      cycleCode: json[CardSectionKey.cycleCode.name] ?? '',
      cycleId: json[CardSectionKey.cycleId.name] ?? 0,
      cycleLibelleLongLt: json[CardSectionKey.cycleLibelleLongLt.name] ?? '',
      dossierEtudiantId: json[CardSectionKey.dossierEtudiantId.name] ?? 0,
      id: json[CardSectionKey.id.name] ?? 0,
      individuDateNaissance:
          DateTime.tryParse(json[CardSectionKey.individuDateNaissance.name]) ??
              DateTime.now(),
      individuId: json[CardSectionKey.individuId.name] ?? 0,
      individuLieuNaissance:
          json[CardSectionKey.individuLieuNaissance.name] ?? '',
      individuLieuNaissanceArabe:
          json[CardSectionKey.individuLieuNaissanceArabe.name] ?? '',
      individuNomArabe: json[CardSectionKey.individuNomArabe.name] ?? '',
      individuNomLatin: json[CardSectionKey.individuNomLatin.name] ?? '',
      individuPrenomArabe: json[CardSectionKey.individuPrenomArabe.name] ?? '',
      individuPrenomLatin: json[CardSectionKey.individuPrenomLatin.name] ?? '',
      lastMoyenne: (json[CardSectionKey.lastMoyenne.name] ?? 0.0).toDouble(),
      llEtablissementArabe:
          json[CardSectionKey.llEtablissementArabe.name] ?? '',
      llEtablissementLatin:
          json[CardSectionKey.llEtablissementLatin.name] ?? '',
      moyenneBac: (json[CardSectionKey.moyenneBac.name] ?? 0.0).toDouble(),
      nin: json[CardSectionKey.nin.name] ?? '',
      niveauCode: json[CardSectionKey.niveauCode.name] ?? '',
      niveauId: json[CardSectionKey.niveauId.name] ?? 0,
      niveauLibelleLongAr: json[CardSectionKey.niveauLibelleLongAr.name] ?? '',
      niveauLibelleLongLt: json[CardSectionKey.niveauLibelleLongLt.name] ?? '',
      niveauRang: json[CardSectionKey.niveauRang.name] ?? 0,
      numeroInscription: json[CardSectionKey.numeroInscription.name] ?? '',
      numeroMatricule: json[CardSectionKey.numeroMatricule.name] ?? '',
      ofCodeDomaine: json[CardSectionKey.ofCodeDomaine.name] ?? '',
      ofCodeFiliere: json[CardSectionKey.ofCodeFiliere.name] ?? '',
      ofCodeSpecialite: json[CardSectionKey.ofCodeSpecialite.name] ?? '',
      ofIdDomaine: json[CardSectionKey.ofIdDomaine.name] ?? 0,
      ofIdFiliere: json[CardSectionKey.ofIdFiliere.name] ?? 0,
      ofIdSpecialite: json[CardSectionKey.ofIdSpecialite.name] ?? 0,
      ofLlDomaine: json[CardSectionKey.ofLlDomaine.name],
      ofLlDomaineArabe: json[CardSectionKey.ofLlDomaineArabe.name] ?? '',
      ofLlFiliere: json[CardSectionKey.ofLlFiliere.name],
      ofLlFiliereArabe: json[CardSectionKey.ofLlFiliereArabe.name] ?? '',
      ofLlSpecialite: json[CardSectionKey.ofLlSpecialite.name] ?? '',
      ofLlSpecialiteArabe: json[CardSectionKey.ofLlSpecialiteArabe.name] ?? '',
      ouvertureOffreFormationId:
          json[CardSectionKey.ouvertureOffreFormationId.name],
      photo: json[CardSectionKey.photo.name] ?? '',
      refCodeEtablissement:
          json[CardSectionKey.refCodeEtablissement.name] ?? '',
      refLibelleCycle: json[CardSectionKey.refLibelleCycle.name] ?? '',
      refLibelleCycleAr: json[CardSectionKey.refLibelleCycleAr.name] ?? '',
      refCodeCycle: json[CardSectionKey.refCodeCycle.name] ?? '',
    );
  }
}

class StudentCardEvent extends ServiceEvent<StudentCardResponse> {
  StudentCardEvent({required super.eventData, super.callback})
      : super(studentCardEventId, studentCardEventName, serviceId);
}
