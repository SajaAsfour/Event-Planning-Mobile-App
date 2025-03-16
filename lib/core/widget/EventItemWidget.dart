// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/providers/favorite_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';

class Eventitemwidget extends StatelessWidget {
  final dynamic event;

  Eventitemwidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, child) {
        bool isFav = favoriteProvider.isFavorite(event);

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          margin: EdgeInsets.only(bottom: 20),
          height: 260,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/birthday.png"),
              fit: BoxFit.fill,
            ),
            border: Border.all(
              color: themeProvider.app_theme == ThemeMode.dark
                  ? AppColors.primaryDark
                  : AppColors.primaryLight,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat("dd").format(
                        DateFormat("dd/MM/yyyy").parse(event['dateTime']),
                      ),
                      style: TextStyle(
                        color: themeProvider.app_theme == ThemeMode.dark
                            ? AppColors.primaryDark
                            : AppColors.primaryLight,
                        fontFamily: "Times New Roman",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat("MMM").format(
                        DateFormat("dd/MM/yyyy").parse(event['dateTime']),
                      ),
                      style: TextStyle(
                        color: themeProvider.app_theme == ThemeMode.dark
                            ? AppColors.primaryDark
                            : AppColors.primaryLight,
                        fontFamily: "Times New Roman",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        event["title"],
                        style: TextStyle(
                          color: themeProvider.app_theme == ThemeMode.dark
                              ? AppColors.primaryDark
                              : AppColors.primaryLight,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav
                            ? AppColors.redColor
                            : themeProvider.app_theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                      ),
                      onPressed: () {
                        favoriteProvider.toggleFavorite(event);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
