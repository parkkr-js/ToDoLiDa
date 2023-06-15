import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFe2e2ff);
  static Color mainColor = Color.fromARGB(255, 237, 101, 92);
  static Color accentColor = const Color(0xFF0065FF);
  static Color personalColor = Colors.pinkAccent;
  static Color workColor = const Color.fromARGB(255, 52, 139, 97);
  static Color shoppingColor = const Color.fromARGB(255, 156, 64, 255);
  static Color meetingColor = Color.fromARGB(255, 64, 140, 255);
  static Color studyColor = Color.fromARGB(255, 255, 134, 64);
  static Color playColor = Color.fromARGB(255, 207, 207, 18);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w500);
}
