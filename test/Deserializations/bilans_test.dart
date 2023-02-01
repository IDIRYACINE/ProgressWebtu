import 'package:flutter_test/flutter_test.dart';
import 'package:progresswebtu/core/api/feature.dart';

import '../data/loader.dart';

void main() {
  test('Deserializae Bilans Api Response', () async {
    const expectedMcLabel = "Architecture des ordinateurs";
    const bilanIndex = 0;
    const ueIndex = 0;
    const mcIndex = 0;

    final jsonData = loadJsonFileContent("api_response_bilans.json");

    final List<SessionBilan> bilans = [];

    jsonData.forEach((e) {
      bool annuel = e[SessionBilanKey.annuel.name] ?? false;
      if (!annuel) {
        bilans.add(SessionBilan.fromJson(e));
      }
    });


    final libelle =
        bilans[bilanIndex].bilanUes[ueIndex].bilanMcs[mcIndex].mcLibelleFr;

    expect(libelle, expectedMcLabel);
  });
}
