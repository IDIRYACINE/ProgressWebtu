import 'package:flutter_test/flutter_test.dart';
import 'package:progresswebtu/core/api/feature.dart';

import '../data/loader.dart';

void main() {
  test('Deserializae ExamNotes Api Response', () async {
    const firstNoteId = 111743121;

    final jsonData = loadJsonFileContent("api_response_exams_notes.json");
    final List<ExamNote> notes = List<ExamNote>.from(jsonData.map((e) => ExamNote.fromJson(e)));

    assert(notes.first.id == firstNoteId, "Should have same Id");
  });
}
