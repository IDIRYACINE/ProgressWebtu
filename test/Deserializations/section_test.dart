
import 'package:flutter_test/flutter_test.dart';
import 'package:progresswebtu/core/api/feature.dart';

import '../data/loader.dart';

void main() {
  

  test('Deserializae Section Api Response', () async {
    
  final jsonData = loadJsonFileContent("api_response_sections.json");
  
  final List<Section> sections = jsonData.map((e) => Section.fromJson(e)).toList();

  assert(sections.length == 2 , "Should have 2 sections");
  });
}
