// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';

class Tabeventwidget extends StatelessWidget {
  Tabeventwidget(
      {super.key, required this.eventName, required this.isSelected});
  String eventName;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.whiteColor : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: Consumer<AppThemeProvider>(
        builder: (context, themeProvider, child) {
          return Text(
            eventName,
            style: TextStyle(
              color: isSelected
                  ? themeProvider.app_theme == ThemeMode.light
                      ? AppColors.primaryLight
                      : AppColors.primaryDark
                  : AppColors.whiteColor,
              fontFamily: "Times New Roman",
            ),
          );
        },
      ),
    );
  }
}
