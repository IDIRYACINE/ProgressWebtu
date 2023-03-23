

import 'package:progresswebtu/constants/metadata.dart';

double examResultToCircularProgress(double note){
  return note/AppMetadata.maxExamResult;
}