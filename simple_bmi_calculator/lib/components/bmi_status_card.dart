import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/bmi_result_status.dart';

/// This widget displays the result of the BMI calculation.
/// The result is displayed in a card.
/// The color of the card is determined by the status of the result.
/// The status is determined by the value of the BMI.
/// The status is then used to determine the feedback message to be displayed.
///
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
          //TODO: Use the RichText widget to display the status and feedback message
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
