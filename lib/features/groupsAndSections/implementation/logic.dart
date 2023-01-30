import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/parser.dart';
import 'package:progresswebtu/widgets/dialogs.dart';

class SectionsLogic {
  static const id = "Sections Logic";

  SectionsLogic();

  late BuildContext context;

  void onBacSummaryFail() {
    buildHintDialog("Could not get bac summary");
  }

  void setWidgetContext(BuildContext context) {
    this.context = context;
  }

  void loadSections(String username, String token) {
    String bacNumber = parseBacNumberFromUsername(username);
    String bacYear = parseBacYearFromUsername(username);

    final data = SectionsEventData(
        username: bacNumber, bacYear: bacYear, authKey: token, requesterId: id);
    final event = GroupSectionEvent(eventData: data);

    ApiService.instance().onEventForResponse(event).then((response) =>
        _sendUpdateSectionsEvent(response as SectionsResponse));
  }

  void _sendUpdateSectionsEvent(SectionsResponse response) {
    final event = UpdateSections(response.sections!);

    BlocProvider.of<AppBloc>(context).add(event);
  }
}
