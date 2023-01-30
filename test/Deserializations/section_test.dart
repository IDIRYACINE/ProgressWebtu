
import 'package:flutter_test/flutter_test.dart';
import 'package:progresswebtu/core/api/feature.dart';

import '../data/loader.dart';

void main() {
  

  test('Deserializae', () async {
    
  final jsonData = loadJsonFileContent("sections_api_response.json");
  
  final sections = jsonData.map((e) => Section.fromJson(e)).toList();

  assert(sections.length == 2 , "Should have 2 sections");
  });
}
