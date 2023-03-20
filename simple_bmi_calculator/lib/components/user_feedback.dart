import 'package:flutter/material.dart';

import '../utils/colors.dart';

userFeedback(context, String message) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black12,
    builder: (context) => AlertDialog(
      title: const Text('Warning'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK',
              style: TextStyle(
                fontSize: 20,
                color: kSecondaryColor,
              )),
        ),
      ],
    ),
  );
}
