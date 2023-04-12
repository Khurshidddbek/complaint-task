import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/configs/app_colors.dart';

import 'app_padding.dart';

class AppThemes {
  static var lightAppTheme = ThemeData(
    primaryColor: AppColors.black,
    fontFamily: GoogleFonts.nunito().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.black),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPaddings.side),
      fillColor: AppColors.grey,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.greyBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.greyBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.greyBorder),
      ),
    ),
  );
}
