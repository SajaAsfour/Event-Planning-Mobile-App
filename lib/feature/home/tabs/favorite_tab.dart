// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              hintText:  AppLocalizations.of(context)!.search,
              hintStyle: TextStyle(
                fontFamily: "Times New Roman",
              ),
              labelText: AppLocalizations.of(context)!.search,
              labelStyle: TextStyle(
                fontFamily: "Times New Roman",
                color: AppColors.primaryLight,
                fontWeight: FontWeight.bold
              ),
              prefixIcon: Icon(Icons.search , color: AppColors.primaryLight,),
              color: AppColors.primaryLight,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return Eventitemwidget();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
