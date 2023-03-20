import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

typedef GetSex = void Function(String sex);

class KCard extends StatelessWidget {
  const KCard(
      {super.key,
      required this.icon,
      required this.color,
      required this.text,
      required this.getSex});

  final IconData icon;
  final Color color;
  final String text;
  final GetSex getSex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getSex(text == 'MALE' ? 'male' : 'female');
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 150,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: kAccentColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80.0,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: GoogleFonts.inter(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
