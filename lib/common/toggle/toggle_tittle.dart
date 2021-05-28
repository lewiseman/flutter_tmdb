import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget toggleTittle(title) {
  return Padding(
    padding: EdgeInsets.only(right: 20),
    child: Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
