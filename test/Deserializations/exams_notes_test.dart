import 'package:flutter_test/flutter_test.dart';
import 'package:progresswebtu/core/api/feature.dart';

import '../data/loader.dart';

void main() {
  test('Deserializae ExamNotes Api Response', () async {
    const expectedExamNote = 10;
    const noteIndex = 6;

    final jsonData = loadJsonFileContent("api_response_exams_notes.json");
    final List<ExamNote> notes = List<ExamNote>.from(jsonData.map((e) => ExamNote.fromJson(e)));

    expect(notes[noteIndex].examNote, expectedExamNote);
  });
}
