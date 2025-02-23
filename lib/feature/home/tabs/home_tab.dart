// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Saja Asfour",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.sunny),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.whiteColor,
                  child: Text(
                    "EN",
                    style: TextStyle(
                        color: AppColors.primaryLight,
                        fontFamily: "Times New Romman"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 115,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.whiteColor,
                      size: 24,
                    ),
                    Text(
                      "Ramallah , Palestine",
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          color: AppColors.whiteColor,
                          fontSize: 17),
                    )
                  ],
                ),
                DefaultTabController(
                  length: 3,
                  child: TabBar(
                    indicatorColor: AppColors.transparentColor,
                    dividerColor: AppColors.transparentColor,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 10
                    ),
                    tabs: [
                      Tab(icon: Icon(Icons.directions_car)),
                      Tab(icon: Icon(Icons.directions_transit)),
                      Tab(icon: Icon(Icons.directions_bike)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
