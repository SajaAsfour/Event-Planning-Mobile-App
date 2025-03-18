// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/models/event_model.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});

  Future<List<EventModel>> getFavoriteEvents() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection(EventModel.collectionName)
        .where("isFav", isEqualTo: true)
        .get();

    return querySnapshot.docs
        .map((doc) => EventModel.fromFireStore(doc.data()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, child) {
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
                  hintStyle: TextStyle(
                    fontFamily: "Times New Roman",
                  ),
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
                  child: FutureBuilder<List<EventModel>>(
                    future: getFavoriteEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                          "Error fetching favorites",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 20,
                            color: themeProvider.app_theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                          ),
                        ));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child: Text(
                          "No favorite events yet!",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 20,
                            color: themeProvider.app_theme == ThemeMode.dark
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                          ),
                        ));
                      } else {
                        List<EventModel> favoriteEvents = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemCount: favoriteEvents.length,
                          itemBuilder: (context, index) {
                            return Eventitemwidget(
                                event: favoriteEvents[index]);
                          },
                        );
                      }
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
