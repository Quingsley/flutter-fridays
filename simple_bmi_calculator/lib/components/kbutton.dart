import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

/// This widget displays a   button
/// The button is displayed on the home page to calculate the BMI

class KButton extends StatelessWidget {
  const KButton({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kSecondaryColor,
          elevation: 10,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'CALCULATE YOUR BMI',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
