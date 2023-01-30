

import 'dart:convert';
import 'dart:io';

dynamic loadJsonFileContent(String fileName) {
  
  final file = File("${Directory.current.path}/test/data/$fileName");
  final content = file.readAsStringSync();
  return json.decode(content);
}