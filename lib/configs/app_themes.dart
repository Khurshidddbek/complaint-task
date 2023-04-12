import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/configs/app_colors.dart';

class AppThemes {
  static var lightAppTheme = ThemeData(
    primaryColor: AppColors.black,
    fontFamily: GoogleFonts.nunito().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.black),
      elevation: 0,
    ),
  );
}
