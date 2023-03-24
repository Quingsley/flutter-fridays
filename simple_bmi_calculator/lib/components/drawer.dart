import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

/// This widget displays the navigation drawer
/// The drawer is displayed on the left side of the screen
/// The drawer contains a list of links to other pages
/// The drawer is displayed on all pages
/// The drawer is displayed when the user clicks on the hamburger icon

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
