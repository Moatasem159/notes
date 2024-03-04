import 'package:flutter/material.dart';
import 'package:notes/config/lang/app_localizations_setup.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/config/themes/app_theme.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRoute.router,
      supportedLocales:AppLocalizationsSetup.supportedLocales,
      localizationsDelegates:AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback:AppLocalizationsSetup.localeResolutionCallback,
    );
  }
}