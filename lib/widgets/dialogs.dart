
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

Widget buildLoadingDialog() {
    return   AlertDialog(
        content: ConstrainedBox(
      constraints:  const BoxConstraints(maxHeight: 100),
      child:const Center(child: CircularProgressIndicator()),
      ),
    );
  } 