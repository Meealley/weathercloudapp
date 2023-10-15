import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;

  final String label;
  final String value;

  const AdditionalInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.epilogue(
            textStyle: const TextStyle(fontSize: 17),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Icon(icon),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: GoogleFonts.epilogue(
            textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
