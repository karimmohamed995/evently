import 'package:evently/ui/providers/language_provider.dart';
import 'package:evently/ui/providers/theme_provider.dart';
import 'package:evently/ui/screens/add_event/add_event.dart';
import 'package:evently/ui/screens/home/home.dart';
import 'package:evently/ui/screens/splash/splash.dart';
import 'package:evently/ui/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

void main() {
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (_) => ThemeProvider() ,
  //     child: ChangeNotifierProvider(create: (_) => LanguageProvider(), child: MyApp())),
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // String currentLanguage = "en";
  MyApp({super.key});
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.mode,
      locale: Locale(languageProvider.currentLocale),

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],

      home: AddEvent(),
    );
  }
}
