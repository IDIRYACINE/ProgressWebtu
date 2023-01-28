

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/parser.dart';
import 'package:progresswebtu/widgets/dialogs.dart';

typedef SetState = void Function(void Function() fn);

class BacViewLogic{

  static const id = "BacViewLogic";

  SetState? setState;

  void onBacSummaryFail(){
    buildHintDialog("Could not get bac summary");
  }

  void onBacSummarySuccess(BacSummary response){
    setState?.call(() {});
  }

  Future<BacSummary> loadBacSummary(String username,String authKey) async {
    String bacNumber = parseBacNumberFromUsername(username);
    String bacYear = parseBacYearFromUsername(username);

    final data = BacSummaryEventData(username: bacNumber, bacYear: bacYear, authKey: authKey, requesterId: id);
    final event = BacSummaryEvent(eventData: data);

    return ApiService.instance().onEventForResponse(event).then((response) => response as BacSummary);
   
  }
}