// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_theme.dart';
import 'package:tevent/feature/home/add_event_page.dart';
import 'package:tevent/feature/home/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/feature/auth/login/login_page.dart';
import 'core/providers/app_language_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (contex) => AppLanguageProvider()),
      ChangeNotifierProvider(create: (contex) => AppThemeProvider())
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: themeProvider.app_theme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      locale: Locale(languageProvider.appLanguage),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home':(context) => HomePage(),
        '/addEvent' : (context) => AddEventPage()
      },
    );
  }
}
