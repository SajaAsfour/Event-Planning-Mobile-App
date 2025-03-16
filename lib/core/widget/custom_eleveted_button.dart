// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';

class CustomElevetedButton extends StatelessWidget {
  final String text ;
  final Function () onPressed;
  const CustomElevetedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, child) {
   return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: themeProvider.app_theme == ThemeMode.dark? AppColors.primaryDark:
          AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: "Times New Roman",
            color: AppColors.whiteColor),
      ),
    );
    },
    );
  }
}
