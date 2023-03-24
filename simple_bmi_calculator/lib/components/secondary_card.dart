import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

typedef GetValue = void Function(int value);

///  This widget is simply a custom card
///  It takes the text and a function as parameters.
/// The function is called when the increment or decrement button is tapped.
/// The function is called with the new value as a parameter

class SCard extends StatefulWidget {
  const SCard({super.key, required this.text, required this.getValue});
  final String text;
  final GetValue getValue;

  @override
  State<SCard> createState() => _SCardState();
}

class _SCardState extends State<SCard> {
  int _initialValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
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
            Text(
              widget.text,
              style: GoogleFonts.inter(
                color: Colors.grey.shade400,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$_initialValue',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    iconSize: 48,
                    onPressed: () {
                      setState(() {
                        _initialValue++;
                        widget.getValue(_initialValue);
                      });
                    },
                    splashRadius: 30,
                    splashColor: Colors.grey.withOpacity(0.3),
                    icon: const Icon(
                      color: Colors.white,
                      Icons.add,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    iconSize: 48,
                    onPressed: () {
                      setState(() {
                        if (_initialValue > 0) {
                          _initialValue--;
                          widget.getValue(_initialValue);
                        }
                      });
                    },
                    splashRadius: 30,
                    splashColor: Colors.grey.withOpacity(0.3),
                    icon: const Icon(
                      color: Colors.white,
                      Icons.remove,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
