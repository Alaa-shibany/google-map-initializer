import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_initializer/theme/color.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  visualDensity: VisualDensity.standard,
  useMaterial3: true,

  //======= Text Theme =======/sofiaSans
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.sofiaSans(color: Colors.black),
    bodyMedium: GoogleFonts.sofiaSans(color: Colors.black),
    bodySmall: GoogleFonts.sofiaSans(color: Colors.black),
    titleLarge: GoogleFonts.sofiaSans(color: Colors.black),
    titleMedium: GoogleFonts.sofiaSans(color: Colors.black),
    titleSmall: GoogleFonts.sofiaSans(color: Colors.black),
    displayLarge: GoogleFonts.sofiaSans(color: Colors.black),
    displayMedium: GoogleFonts.sofiaSans(color: Colors.black),
    displaySmall: GoogleFonts.sofiaSans(color: Colors.black),
    headlineLarge: GoogleFonts.sofiaSans(color: Colors.black),
    headlineMedium: GoogleFonts.sofiaSans(color: Colors.black),
    headlineSmall: GoogleFonts.sofiaSans(color: Colors.black),
    labelLarge: GoogleFonts.sofiaSans(color: Colors.black),
    labelMedium: GoogleFonts.sofiaSans(color: Colors.black),
    labelSmall: GoogleFonts.sofiaSans(color: Colors.black),
  ),

  //==========Button Theme ========///
  buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),

  //======Icon Theme ========//
  iconTheme: const IconThemeData(color: AppColors.gray, size: 30),

  //========= List tile Theme =======//
  listTileTheme: const ListTileThemeData(iconColor: AppColors.gray),

  //========= text field Theme =======//
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.sofiaSans(color: Colors.grey.withOpacity(0.5)),
    labelStyle: GoogleFonts.sofiaSans(color: AppColors.gray),
    // focusColor: AppColors.dark,
    // hoverColor: AppColors.dark,
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColors.borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColors.borderColor),
    ),
  ),

  //===== App Bar Theme======//
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.sofiaSans(
      fontSize: 20,
      color: AppColors.textLightColor,
    ),
    backgroundColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
  ),

  //======= Tab Bar Theme =======//
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.textLightColor,
    unselectedLabelColor: AppColors.secondaryColor,
    labelStyle: GoogleFonts.sofiaSans(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: GoogleFonts.sofiaSans(
      color: AppColors.secondaryColor,
    ),
    indicator: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(5),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
  ),

  //======= Elevated Button Theme =======//
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      textStyle: GoogleFonts.sofiaSans(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  //======= Card Theme =======//
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    margin: const EdgeInsets.all(8.0),
  ),

  //======= Popup Menu Theme =======//
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.primaryColor,
    textStyle: GoogleFonts.sofiaSans(color: Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  ),

  //======= Selection Text Theme =======//
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: AppColors.primaryColor.withOpacity(0.5),
    selectionHandleColor: AppColors.primaryColor,
  ),

  //======= Progrss Indicator Theme =======//
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
  ),

  //Indicator Theme
  indicatorColor: AppColors.primaryColor,
);
