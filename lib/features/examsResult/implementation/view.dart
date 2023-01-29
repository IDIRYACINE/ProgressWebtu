

import 'package:flutter/material.dart';

class ExamsResultView extends StatelessWidget {
  const ExamsResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams Result'),
      ),
      body: const Center(
        child: Text('Exams Result'),
      ),
    );
  }
}