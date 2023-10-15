import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;

  const HourlyForecastItem(
      {super.key,
      required this.time,
      required this.temperature,
      required this.icon});

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
              time,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.epilogue(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              temperature,
              style: GoogleFonts.epilogue(
                  textStyle: const TextStyle(fontSize: 14)),
            )
          ],
        ),
      ),
    );
  }
}
