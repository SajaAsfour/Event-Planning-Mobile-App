// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';

import '../../core/providers/app_language_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: TextStyle(
            fontFamily: "Times New Roman",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.la,
              style: TextStyle(
                fontFamily: "Times New Roman",
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
                value: languageProvider.appLanguage,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 18,
                          ),
                        ),
                        if (languageProvider.appLanguage == 'en')
                          Icon(Icons.check, color: AppColors.greenColor)
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "العربية",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 18,
                          ),
                        ),
                        if (languageProvider.appLanguage == 'ar')
                          Icon(Icons.check, color: AppColors.greenColor)
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  languageProvider.changeLanguage(value.toString());
                }),
            SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: TextStyle(
                fontFamily: "Times New Roman",
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<ThemeMode>(
                value: themeProvider.app_theme,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.light,
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 18,
                          ),
                        ),
                        if (themeProvider.app_theme == ThemeMode.light)
                          Icon(Icons.check, color: AppColors.greenColor)
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dark,
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontSize: 18,
                            ),
                          ),
                          if (themeProvider.app_theme == ThemeMode.dark)
                            Icon(Icons.check, color: AppColors.greenColor)
                        ],
                      ))
                ],
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.changeTheme(value);
                  }
                })
          ],
        ),
      ),
    );
  }
}
