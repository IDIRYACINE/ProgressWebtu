import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int sectionEventId = Apis.sectionAndGroups.index;
final String sectionEventName = Apis.sectionAndGroups.name;

class SectionsAndGroupsCommand
    extends Command<SectionsEventData, SectionsRawEventData, SectionsResponse> {
  final Map<String, String> _headers;
  SectionsAndGroupsCommand([this._headers = const {}])
      : super(sectionEventId, sectionEventName);

  @override
  Future<SectionsResponse> handleEvent(SectionsEventData eventData) {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<SectionsResponse> handleRawEvent(SectionsRawEventData eventData) {
    Api api = SectionsAndGroupsApi();

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
        List<Section> sections = decodedResponse
            .map((e) => Section.fromJson(e as Map<String, dynamic>))
            .toList();

        return SectionsResponse(
            messageId: eventData.messageId, sections: sections);
      } catch (e) {
        return SectionsResponse(
            status: ServiceEventResponseStatus.error,
            messageId: eventData.messageId);
      }
    });
  }
}

class SectionsEventData extends ServiceEventData<SectionsRawEventData> {
  final String username;

  final String bacYear;

  final String authKey;
  SectionsEventData({
    required this.username,
    required this.bacYear,
    required this.authKey,
    required String requesterId,
  }) : super(requesterId);

  @override
  SectionsRawEventData toRawServiceEventData() {
    return SectionsRawEventData(
        authKey: authKey,
        bacYear: bacYear,
        username: username,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class SectionsRawEventData extends RawServiceEventData {
  final String username;

  final String bacYear;

  final String authKey;

  SectionsRawEventData(
      {required this.username,
      required this.bacYear,
      required this.authKey,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, sectionEventId);
}

class SectionsResponse extends ServiceEventResponse {
  final List<Section>? sections;

  SectionsResponse({
    this.sections,
    required int messageId,
    ServiceEventResponseStatus status = ServiceEventResponseStatus.success,
  }) : super(messageId, status);
}

enum SectionKey {
  dateAffectation,
  groupePedagogiqueId,
  id,
  nomGroupePedagogique,
  nomSection,
  periodeCode,
  periodeId,
  periodeLibelleLongLt,
}

class Section {
  final String dateAffectation;
  final int groupePedagogiqueId;
  final int id;
  final String nomGroupePedagogique;
  final String nomSection;
  final String periodeCode;
  final int periodeId;
  final String periodeLibelleLongLt;

  Section(
      {required this.dateAffectation,
      required this.groupePedagogiqueId,
      required this.id,
      required this.nomGroupePedagogique,
      required this.nomSection,
      required this.periodeCode,
      required this.periodeId,
      required this.periodeLibelleLongLt});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      dateAffectation: json[SectionKey.dateAffectation.name] ?? "",
      groupePedagogiqueId: json[SectionKey.groupePedagogiqueId.name] ?? 0,
      id: json[SectionKey.id.name] ?? 0,
      nomGroupePedagogique: json[SectionKey.nomGroupePedagogique.name] ?? "",
      nomSection: json[SectionKey.nomSection.name] ?? "",
      periodeCode: json[SectionKey.periodeCode.name] ?? "",
      periodeId: json[SectionKey.periodeId.name] ?? 0,
      periodeLibelleLongLt: json[SectionKey.periodeLibelleLongLt.name] ?? "",
    );
  }
}

class GroupSectionEvent extends ServiceEvent<SectionsResponse> {
  GroupSectionEvent({required super.eventData, super.callback})
      : super(sectionEventId, sectionEventName, serviceId);
}
