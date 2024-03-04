import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_fonts.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      fontFamily: AppFonts.englishFontFamily,
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
      ));
  static final ThemeData darkTheme = ThemeData(
      fontFamily: AppFonts.englishFontFamily,
      drawerTheme: const DrawerThemeData(
        backgroundColor:  AppColors.darkBackgroundColor,
        elevation: 0,
      ),
      listTileTheme: const ListTileThemeData()
          .copyWith(selectedColor: AppColors.darkActiveDrawerColor),
      colorScheme: const ColorScheme.dark().copyWith(
          background: AppColors.darkBackgroundColor,
          primary: Colors.white,
          secondary: Colors.white));

  static SystemUiOverlayStyle systemUiOverlayStyle() =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? _darkSystemUiOverlayStyle
          : _whiteSystemUiOverlayStyle;
  static const SystemUiOverlayStyle _whiteSystemUiOverlayStyle =
      SystemUiOverlayStyle(
          // statusBarColor: AppColors.whiteBackgroundColor,
          // statusBarBrightness: Brightness.dark,
          // statusBarIconBrightness: Brightness.dark,
          // systemNavigationBarColor: AppColors.whiteSecondaryColor
          );
  static const SystemUiOverlayStyle _darkSystemUiOverlayStyle =
      SystemUiOverlayStyle(
          // statusBarColor: AppColors.blackBackgroundColor,
          // statusBarBrightness: Brightness.light,
          // statusBarIconBrightness: Brightness.light,
          // systemNavigationBarColor: AppColors.blackSecondaryColor,
          );
}
