import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

typedef GetHeight = void Function(double height);

/// This widget displays the height container
/// The height container is displayed on the home page
/// The height container contains a slider to select the height
class HeightContainer extends StatefulWidget {
  const HeightContainer({super.key, required this.getHeight});
  final GetHeight getHeight;

  @override
  State<HeightContainer> createState() => _HeightContainerState();
}

class _HeightContainerState extends State<HeightContainer> {
  double _height = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'HEIGHT',
            style: GoogleFonts.inter(
              color: Colors.grey.shade400,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${_height.round().toString()} cm',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Slider(
            value: _height,
            min: 0,
            max: 272,
            activeColor: kSecondaryColor,
            secondaryActiveColor: Colors.white,
            label: _height.round().toString(),
            inactiveColor: Colors.grey.shade400,
            onChanged: (value) {
              setState(() {
                _height = value;
              });
            },
            onChangeEnd: (value) {
              // Step 2: Call the Callback.
              widget.getHeight(value);
            },
          ),
        ],
      ),
    );
  }
}
