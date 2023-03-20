import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/bmi_status_card.dart';

import '../components/drawer.dart';
import '../utils/colors.dart';

class BMIResult extends StatelessWidget {
  const BMIResult({super.key});

  @override
  Widget build(BuildContext context) {
    double bmi = 0;
    final data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      bmi = data as double;
    }
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawer: const KDrawer(),
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: kPrimaryColor.withOpacity(0.9),
        shadowColor: Colors.blueGrey.withOpacity(0.6),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'BMI Result : ${bmi.round().toString()}',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 48,
              ),
            ),
            if (bmi == 0)
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    backgroundColor: kSecondaryColor),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                child: Text(
                  'Please calculate your BMI first!!',
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            if (bmi != 0) BMIStatusCard(bmi: bmi),
          ],
        ),
      ),
    );
  }
}
