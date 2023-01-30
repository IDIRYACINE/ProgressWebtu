import 'package:flutter_test/flutter_test.dart';
import 'package:progresswebtu/core/api/feature.dart';

import '../data/loader.dart';

void main() {
  test('Deserializae StudentCard Api Response', () async {
    const latestYearStudentId = 10029915;

    final jsonData = loadJsonFileContent("api_response_student_card.json");
    final List<StudentCardSection> years = List<StudentCardSection>.from(jsonData.map((e) => StudentCardSection.fromJson(e)));

    assert(years.first.id == latestYearStudentId, "Should have same Id");
  });
}
