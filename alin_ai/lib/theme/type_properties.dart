// A typical theme configuration may include primary and secondary colors, text, and button styles.

//1. Use ThemeData on the Material App to set the type properties for 3 headlines and body copy (think type pairings),
//along with a primary and secondary color choice. Create a type sheet that illustrates your choices.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData typeProperties = ThemeData(
  appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.grey,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
        //using the googlefont class to access fonts as to individually importing them.
        //(thanks to reddit search: https://stackoverflow.com/questions/64237031/how-to-change-the-default-font-family-in-flutter)
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: FontWeight.bold,
      )),
  textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
);
