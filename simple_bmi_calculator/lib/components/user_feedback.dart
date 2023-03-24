import 'package:flutter/material.dart';

import '../utils/colors.dart';

/// This widget displays a dialog box
/// The dialog box is displayed when the user enters invalid data
/// The dialog box is displayed when the user clicks on the calculate button
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
