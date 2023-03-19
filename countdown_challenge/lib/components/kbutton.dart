import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  const KButton({super.key, required this.startTimer, required this.text});
  final Function() startTimer;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: startTimer,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 10,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
