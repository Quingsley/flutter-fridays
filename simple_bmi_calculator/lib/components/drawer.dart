import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kSecondaryColor,
            ),
            child: Center(
              child: Text(
                'BMI Calculator',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/home'),
            leading: const Icon(
              Icons.calculate,
              color: Colors.white,
            ),
            title: Text(
              'Calculate your BMI',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/result'),
            leading: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text(
              'Result',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
