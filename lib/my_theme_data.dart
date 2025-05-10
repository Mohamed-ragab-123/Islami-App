import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFFE2BE7F);
  static const Color blackColor = Color(0xFF202020);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      secondaryHeaderColor: blackColor,
      scaffoldBackgroundColor:  Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xFFE2BE7F,),
        ),
      ),
      textTheme: TextTheme(
        titleSmall: GoogleFonts.roboto(
          color: primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.roboto(
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.roboto(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: GoogleFonts.roboto(
          color: blackColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.roboto(
          color: blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.roboto(
          color: blackColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: blackColor,
  )
  );

  static ThemeData darkTheme = ThemeData();
}