import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/bmi_result_status.dart';

class BMIStatusCard extends StatelessWidget {
  const BMIStatusCard({super.key, required this.bmi});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final result = bmiStatusResult(bmi);
    return Card(
        elevation: 5,
        margin: const EdgeInsets.all(20),
        color:
            result['status'] == 'Normal' || result['status'] == 'Normal weight'
                ? Colors.green.shade400
                : result['status'] == 'Underweight'
                    ? Colors.yellow.shade400
                    : Colors.red.shade400,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            '${result['status']}\n ${result['feedback']}',
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: Colors.grey.shade900,
            ),
          ),
        ));
  }
}
