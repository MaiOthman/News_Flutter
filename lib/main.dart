import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app/news/full_view.dart';
import 'package:news_app/providers/lang_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/screens/category_screen/category_details_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/utils/block_observer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'l10n/app_localizations.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider()),
        ChangeNotifierProvider(create: (context)=> LangProvider())
      ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LangProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (context)=> HomeScreen(),
        AppRoutes.fullView: (context)=> FullView()
      },
      themeMode: themeProvider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.DarkTheme,
      locale: Locale(langProvider.appLang),
    );
  }
}
