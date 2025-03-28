// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/providers/event_proivder.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  void initState() {
    super.initState();
    Provider.of<EventProvider>(context, listen: false).getFavoriteEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppThemeProvider, EventProvider>(
      builder: (context, themeProvider, eventProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.search,
                  hintStyle: TextStyle(fontFamily: "Times New Roman"),
                  labelText: AppLocalizations.of(context)!.search,
                  labelStyle: TextStyle(
                    fontFamily: "Times New Roman",
                    color: themeProvider.app_theme == ThemeMode.dark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: themeProvider.app_theme == ThemeMode.dark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                  ),
                  color: themeProvider.app_theme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                ),
                Expanded(
                  child: eventProvider.favoriteEvents.isEmpty
                      ? Center(
                          child: Text(
                            "No favorite events yet!",
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontSize: 20,
                              color: themeProvider.app_theme == ThemeMode.dark
                                  ? AppColors.primaryDark
                                  : AppColors.primaryLight,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          itemCount: eventProvider.favoriteEvents.length,
                          itemBuilder: (context, index) {
                            return EventItemWidget(
                              event: eventProvider.favoriteEvents[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
