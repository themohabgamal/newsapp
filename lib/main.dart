import 'package:flutter/material.dart';
import 'package:news_app/Provider/SettingsProvider.dart';
import 'package:news_app/splash.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/Categories/Categories.dart';
import 'package:news_app/ui/Home/home_screen.dart';
import 'package:news_app/ui/News/news_details.dart';
import 'package:news_app/ui/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create:(context) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));    var sp = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(sp.currentLang),
      supportedLocales: [
        Locale('en'), // English
        Locale('fr'), // arabic
      ],
      debugShowCheckedModeBanner: false,
      title: 'Live News',
      themeMode:sp.currentTheme,
      theme: myTheme.lightTheme,
      darkTheme: myTheme.darkTheme,
      initialRoute: splashScreen.routeName,
      routes: {
        homeScreen.routeName:(context) => homeScreen(),
        splashScreen.routeName:(context) => splashScreen(),
        Categories.routeName:(context) => Categories(),
        settings.routeName:(context) => settings(),
        NewsDetails.routeName:(context) => NewsDetails(),
      },
    );
  }
}

