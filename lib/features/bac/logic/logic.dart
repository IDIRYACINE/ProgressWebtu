import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/parser.dart';
import 'package:progresswebtu/widgets/dialogs.dart';


typedef SetState = void Function(void Function() fn);

class BacViewLogic {
  static const id = "BacViewLogic";

  late BuildContext context ;

  void onBacSummaryFail() {
    buildHintDialog("Could not get bac summary");
  }

  void setWidgetContext(BuildContext context) {
    this.context = context;
  }

  Future<void> loadBacSummary(String username, String authKey) async {
    String bacNumber = parseBacNumberFromUsername(username);
    String bacYear = parseBacYearFromUsername(username);

    final data = BacSummaryEventData(
        username: bacNumber,
        bacYear: bacYear,
        authKey: authKey,
        requesterId: id);
    final event = BacSummaryEvent(eventData: data);

    ApiService.instance().onEventForResponse(event).then((response) =>
        _sendUpdateBacSummaryEvent(response as BacSummaryResponse));
  }

  void _sendUpdateBacSummaryEvent(BacSummaryResponse response) {
    final event = UpdateBacSummary(response.bacSummary!);


    BlocProvider.of<AppBloc>(context).add(event);
  }
}
