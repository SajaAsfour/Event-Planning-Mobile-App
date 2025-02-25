// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class Eventitemwidget extends StatelessWidget {
  const Eventitemwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 7
      ),
      margin: EdgeInsets.only(bottom: 20),
      height: 260,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/birthday.png"),
              fit: BoxFit.fill),
          border: Border.all(color: AppColors.primaryLight, width: 2),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5
            ),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "22",
                  style: TextStyle(
                      color: AppColors.primaryLight,
                      fontFamily: "Times New Roman",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text("Feb." , style: TextStyle(
                      color: AppColors.primaryLight,
                      fontFamily: "Times New Roman",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
