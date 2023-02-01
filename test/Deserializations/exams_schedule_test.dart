import 'package:flutter_test/flutter_test.dart';
import 'package:progresswebtu/core/api/feature.dart';

import '../data/loader.dart';

void main() {
  test('Deserializae ExamSchedules Api Response', () async {
    const expectedPeriodeId = 19;
    const scheduleIndex = 0;

    final jsonData = loadJsonFileContent("api_response_exams_schedule.json");
    final List<ExamSession> notes = List<ExamSession>.from(jsonData.map((e) => ExamSession.fromJson(e)));

    expect(notes[scheduleIndex].idPeriode, expectedPeriodeId);
  });
}
