import 'package:progresswebtu/appState/state.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/parser.dart';
import 'package:progresswebtu/widgets/dialogs.dart';


typedef SetState = void Function(void Function() fn);

class BilansViewLogic {
  static const id = "BilansViewLogic";
  final AppBloc bloc;

  BilansViewLogic(this.bloc);

  void onBacSummaryFail() {
    buildHintDialog("Could not get bac summary");
  }


  Future<void> loadBilans(String username,  String authKey) async {
    final bacId = parseBacNumberFromUsername(username);
    final bacYear = parseBacYearFromUsername(username);

    final data = AllSessionsBilansEventData(
        bacYear: bacYear,
        username: bacId,
        authKey: authKey,
        requesterId: id);
    final event = AllSessionsBilanEvent(eventData: data);

    ApiService.instance().onEventForResponse(event).then((response) =>
        _sendUpdateBilansEvent(response as AllSessionsBilansResponse));
  }

  void _sendUpdateBilansEvent(AllSessionsBilansResponse response) {
    final event = UpdateBilans(response.allSessionsBilans!);


    bloc.add(event);
  }
}
