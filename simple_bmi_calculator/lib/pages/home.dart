import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../components/user_feedback.dart';
import '../components/drawer.dart';
import '../utils/bmi_calculator.dart';
import '../components/height_container.dart';
import '../components/kbutton.dart';
import '../components/secondary_card.dart';
import '../utils/colors.dart';
import '../components/card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age = 0;
  int weight = 0;
  int height = 0;
  String? gender;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KCard(
                  text: 'MALE',
                  icon: PhosphorIcons.genderMaleBold,
                  color: gender == null || gender == 'female'
                      ? Colors.white
                      : kSecondaryColor,
                  getSex: (String gender) {
                    setState(() {
                      this.gender = gender;
                    });
                  },
                ),
                KCard(
                  text: 'FEMALE',
                  icon: PhosphorIcons.genderFemaleBold,
                  color: gender == null || gender == 'male'
                      ? Colors.white
                      : kSecondaryColor,
                  getSex: (String gender) {
                    setState(() {
                      this.gender = gender;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 2),
            HeightContainer(
              getHeight: (double height) {
                setState(() {
                  this.height = height.round().toInt();
                });
              },
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SCard(
                  text: 'WEIGHT',
                  getValue: (int value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),
                SCard(
                  text: 'AGE',
                  getValue: (int value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
              ],
            ),
            KButton(
              onPressed: () {
                if (gender == null || height == 0 || weight == 0 || age == 0) {
                  userFeedback(context,
                      'Please select a gender or enter values(weight, height, age) greater than 0');
                }
                if (height > 0 && weight > 0 && age > 0) {
                  bmi = calculateBMI(
                      height.toDouble(), weight.toDouble(), age, gender!);
                  Navigator.pushNamed(context, '/result', arguments: bmi);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
