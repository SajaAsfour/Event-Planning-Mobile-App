// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:tevent/core/widget/TabEventWidget.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.meetting,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.eating,
    ];
    return Scaffold(
      appBar: AppBar(
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
                Consumer<AppThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Icon(
                      themeProvider.app_theme == ThemeMode.light
                          ? Icons.wb_sunny // Light theme → Sun icon
                          : Icons.nightlight_round, // Dark theme → Moon icon
                      color: Colors.white,
                    );
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Consumer<AppThemeProvider>(
                    builder: (context, themeProvider, child) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.whiteColor,
                    child: Text(
                      AppLocalizations.of(context)!.langauge,
                      style: TextStyle(
                          color: themeProvider.app_theme==ThemeMode.dark?AppColors.primaryDark:
                          AppColors.primaryLight,
                          fontFamily: "Times New Romman"),
                    ),
                  );
                })
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
              color: Theme.of(context).cardColor,
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
                SizedBox(
                  height: 15,
                ),
                DefaultTabController(
                    length: eventNameList.length,
                    child: TabBar(
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        indicatorColor: AppColors.transparentColor,
                        dividerColor: AppColors.transparentColor,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        tabs: eventNameList.map((eventName) {
                          return Tabeventwidget(
                              eventName: eventName,
                              isSelected: selectedIndex ==
                                  eventNameList.indexOf(eventName));
                        }).toList()))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return Eventitemwidget();
                  }))
        ],
      ),
    );
  }
}
