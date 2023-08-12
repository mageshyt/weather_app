import 'package:flutter/material.dart';
import 'package:weather_app/theme/pallet.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
    required this.title,
    required this.value,
    required this.suffix,
  });

  final int value;
  final String title;
  final String suffix;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 75,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 2),
        // color: Pallete.solidColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // header
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text('$value $suffix',
              style: GoogleFonts.nunitoSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
