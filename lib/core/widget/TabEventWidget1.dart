// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class Tabeventwidget1 extends StatelessWidget {
  Tabeventwidget1(
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
        color: isSelected?AppColors.primaryLight:AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryLight, width: 2),
      ),
      child: Text(
        eventName,
        style: TextStyle(
            color: isSelected?AppColors.whiteColor: AppColors.primaryLight, fontFamily: "Times New Roman"),
      ),
    );
  }
}
