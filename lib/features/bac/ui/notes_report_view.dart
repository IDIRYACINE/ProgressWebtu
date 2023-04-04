import 'package:flutter/material.dart';

class NotesReportView extends StatelessWidget {
  const NotesReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes Report'),
      ),
      body: const Center(
        child: Text('Notes Report'),
      ),
    );
  }
}