

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/core/api/implementation/request_builder.dart';
import 'package:progresswebtu/widgets/dialogs.dart';

typedef SetState = void Function(void Function() fn);

class BacViewLogic{

  SetState? setState;

  void onBacSummaryFail(){
    buildHintDialog("Could not get bac summary");
  }

  void onBacSummarySuccess(BacSummary response){
    setState?.call(() {});
  }

  Future<BacSummary> loadBacSummary() async{
    final event = ApiRequestBuilder.buildBacSummaryRequest(
      onFail: onBacSummaryFail,
      onSuccess: onBacSummarySuccess,
    );

    ApiService.instance().onEvent(event);
   
  }
}