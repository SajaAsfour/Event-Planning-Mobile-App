// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_language_provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Consumer<AppThemeProvider>( // Wrap Scaffold with Consumer
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 20,
            backgroundColor: themeProvider.app_theme == ThemeMode.dark
                ? AppColors.primaryDark
                : AppColors.primaryLight,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/birthday.png"),
                        radius: 60,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Saja Asfour",
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              color: AppColors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "saja@gmail.com",
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              color: AppColors.whiteColor,
                              fontSize: 18,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.la,
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color:themeProvider.app_theme == ThemeMode.dark
                ? AppColors.primaryDark
                : AppColors.primaryLight, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    value: languageProvider.appLanguage,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      ),
                    ],
                    onChanged: (value) {
                      languageProvider.changeLanguage(value.toString());
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.theme,
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: themeProvider.app_theme == ThemeMode.dark
                ? AppColors.primaryDark
                : AppColors.primaryLight, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton<ThemeMode>(
                    underline: SizedBox(),
                    value: themeProvider.app_theme,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.changeTheme(value);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
