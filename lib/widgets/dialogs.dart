
  import 'package:flutter/material.dart';
import 'package:progresswebtu/core/navigator/feature.dart';

Widget buildHintDialog([String hint = 'Hint']) {
    return AlertDialog(
      content:  Text(hint),
      actions: [
        TextButton(onPressed: () => AppNavigator.pop(), child: const Text('Ok'))
      ],
    );
  }