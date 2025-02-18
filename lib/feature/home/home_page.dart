// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/providers/app_language_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Times New Roman",
          ),
        ),
        backgroundColor: Colors.teal,
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
                color: Colors.teal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton(
                isExpanded: true,
                dropdownColor: Colors.teal,
                iconEnabledColor: Colors.teal,
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      "English",
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text(
                      "العربية",
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  languageProvider.changeLanguage(value.toString());
                })
          ],
        ),
      ),
    );
  }
}
