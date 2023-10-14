import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Humidity",
          style: GoogleFonts.epilogue(
            textStyle: TextStyle(fontSize: 17),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Icon(Icons.water_drop),
        SizedBox(
          height: 8,
        ),
        Text(
          "90",
          style: GoogleFonts.epilogue(
            textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
