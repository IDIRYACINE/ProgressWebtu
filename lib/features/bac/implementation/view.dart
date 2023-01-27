import 'package:flutter/material.dart';
import 'package:progresswebtu/core/api/feature.dart';
import 'logic.dart';

class BacInformationsView extends StatefulWidget {
  const BacInformationsView({super.key});

  @override
  State<StatefulWidget> createState() => BacInformationsViewState();
}

class BacInformationsViewState extends State<BacInformationsView> {
  final logic = BacViewLogic();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: logic.loadBacSummary(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return _LoadedBacSummary(
                    bacSummary: snapshot.data as BacSummary);
              } else {
                return const Center(child: Text("Failed to load"));
              }
            } else {
              return const Center(child: Text("Loading"));
            }
          }),
    );
  }
}

class _LoadedBacSummary extends StatelessWidget {
  const _LoadedBacSummary({required this.bacSummary});

  final BacSummary bacSummary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("anne Bac : ${bacSummary.anneeBac}"),
        Text("date naissance : ${bacSummary.dateNaissance}"),
        Text("moyenneBac : ${bacSummary.moyenneBac}"),
        Text("nom Fr : ${bacSummary.nomFr}"),
        Text("nom Ar : ${bacSummary.nomAr}"),
        Text("prenom Fr : ${bacSummary.prenomFr}"),
        Text("prenom Ar : ${bacSummary.prenomAr}"),
      ],
    );
  }
}
