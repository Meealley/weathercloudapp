import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "03:00",
              style: GoogleFonts.epilogue(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 6,
            ),
            Icon(Icons.cloud),
            SizedBox(
              height: 6,
            ),
            Text(
              "320.12",
              style: GoogleFonts.epilogue(textStyle: TextStyle(fontSize: 14)),
            )
          ],
        ),
      ),
    );
  }
}
