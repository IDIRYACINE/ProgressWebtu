import 'package:flutter/material.dart';
import 'package:progresswebtu/appState/models/student.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/utility/parser.dart';

class LoadedGroupsAndSections extends StatelessWidget {
  final List<SectionModel> sections;

  const LoadedGroupsAndSections({super.key, required this.sections});

  Widget buildSection(BuildContext context, int index) {
    final section = sections[index];

    return SizedBox(
      height: AppMeasures.groupCardHeight,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _Title(dateTimeStringToDisplay(section.dateAffectation),bold:true),
            if (section.nomSection.isNotEmpty) _Label(section.nomSection),
            _Label(section.periodeLibelleLongLt),
            _Label(section.nomGroupePedagogique),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppMeasures.examCardPadding),
      child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: buildSection,
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String value;

  const _Label(this.value, );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      value,
      style: theme.textTheme.bodyLarge );
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
