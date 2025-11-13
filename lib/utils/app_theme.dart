import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';

class AppTheme{
  static var lightTheme = ThemeData(
    canvasColor: AppColors.primaryLight,
      cardColor: AppColors.primaryDark,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700,
      color: AppColors.primaryLight
      ),
      displayMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500,
          color: AppColors.primaryLight
      ),
      titleSmall: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500,
          color: AppColors.primaryLight),
      titleMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500,
          color: AppColors.primaryLight),
      titleLarge:  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500,
          color: AppColors.primaryDark, letterSpacing: -0.22
      ),
    ),
  );
  static var DarkTheme = ThemeData(
      cardColor: AppColors.primaryLight,
      canvasColor: AppColors.primaryDark,
      textTheme: TextTheme(
  displaySmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700,
  color: AppColors.primaryDark
  ),
          displayMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500,
              color: AppColors.primaryDark
          ),
      titleSmall: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500,
          color: AppColors.primaryDark),
        titleMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500,
            color: AppColors.primaryDark),
          titleLarge:  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500,
              color: AppColors.primaryLight, letterSpacing: -0.22
          ),
        displayLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700,
            color: AppColors.primaryLight
        ),
  )
  );

}