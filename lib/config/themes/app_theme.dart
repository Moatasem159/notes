import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_fonts.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.englishFontFamily,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData()
        .copyWith(selectedColor: AppColors.lightActiveDrawerColor),
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColors.lightBackgroundColor,
      primary: Colors.black,
      secondary: Colors.grey,
      onSecondary: AppColors.lightSeconderBackgroundColor,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    fontFamily: AppFonts.englishFontFamily,
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData()
        .copyWith(selectedColor: AppColors.darkActiveDrawerColor),
    colorScheme: const ColorScheme.dark().copyWith(
        background: AppColors.darkBackgroundColor,
        primary: Colors.white,
        secondary: Colors.white,
        onSecondary: AppColors.darkSeconderBackgroundColor),
  );

  static SystemUiOverlayStyle systemUiOverlayStyle() =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? _darkSystemUiOverlayStyle
          : _whiteSystemUiOverlayStyle;
  static final SystemUiOverlayStyle _whiteSystemUiOverlayStyle =
      SystemUiOverlayStyle(
          statusBarColor: AppColors.lightBackgroundColor.withOpacity(0.85),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.lightBackgroundColor);
  static final SystemUiOverlayStyle _darkSystemUiOverlayStyle =
      SystemUiOverlayStyle(
    statusBarColor: AppColors.darkBackgroundColor.withOpacity(0.85),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.darkBackgroundColor,
  );
}
