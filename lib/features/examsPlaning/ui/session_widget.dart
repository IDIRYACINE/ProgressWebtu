
import 'package:flutter/material.dart';
import 'package:progresswebtu/appState/models/exams.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/utility/parser.dart';

class LoadedExamsSessions extends StatelessWidget {
  const LoadedExamsSessions({super.key, required this.sessions});

  final List<ExamSessionModel> sessions;

  Widget buildSessionWidget(BuildContext context ,int index) {
    final session = sessions[index];
    return SizedBox(
      height: AppMeasures.examCardHeight,
      child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
        children: [
          _Title(session.anneeAcademiqueCode,bold:true),
          _Label(session.intitule),
          _Label(session.codePeriode),
          _Label(dateTimeStringToDisplay(session.dateDebut)),
          _Label(dateTimeStringToDisplay(session.dateFin)),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView.builder(
          itemBuilder: buildSessionWidget, itemCount: sessions.length),
    );
  }
}

class _Label extends StatelessWidget{
  final String value ;

  const _Label( this.value);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(value,style: theme.textTheme.bodyLarge,);
  }

}


class _Title extends StatelessWidget {
  final String value;
  final bool bold;

  const _Title(this.value, {this.bold =false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      value,
      style: theme.textTheme.headlineSmall!.copyWith(fontWeight: bold ? FontWeight.bold :null),
    );
  }
}
