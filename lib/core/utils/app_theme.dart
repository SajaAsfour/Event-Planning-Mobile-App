// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.primaryDark
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryDark,
        unselectedItemColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryLight,
        type: BottomNavigationBarType.fixed),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 5, color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(100)),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.primaryLight
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryDark,
        type: BottomNavigationBarType.fixed),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 5, color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(100)),
    ),
  );
}
