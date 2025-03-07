// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';

class Tabeventwidget1 extends StatelessWidget {
  Tabeventwidget1(
      {super.key, required this.eventName, required this.isSelected});
  String eventName;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(builder: (context, themeProvider, child) {
      return
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: isSelected ?themeProvider.app_theme==ThemeMode.dark?AppColors.primaryDark:AppColors.primaryLight : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:themeProvider.app_theme==ThemeMode.dark?AppColors.primaryDark: AppColors.primaryLight, width: 2),
        ),
        child: Text(
          eventName,
          style: TextStyle(
              color: isSelected ? AppColors.whiteColor :themeProvider.app_theme==ThemeMode.dark?AppColors.primaryDark: AppColors.primaryLight,
              fontFamily: "Times New Roman"),
        ),
      );
    });
  }
}
