import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_fonts.dart';
abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(

    fontFamily: AppFonts.englishFontFamily,
    disabledColor: Colors.black,
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.lightSeconderBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    ),
    buttonTheme: const ButtonThemeData(alignedDropdown: true),
    dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.lightBackgroundColor),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          alignment: Alignment.topLeft,
          elevation: const WidgetStatePropertyAll(8),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isCollapsed: true,
          isDense: true,
          constraints: BoxConstraints(maxHeight: 40, maxWidth: 250),
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          border: UnderlineInputBorder(),
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonLightColor,
        foregroundColor: Colors.white,
      ),
    ),
    dividerTheme:const DividerThemeData(color: AppColors.lightActiveDrawerColor),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      iconColor: WidgetStateProperty.all(Colors.black),
    )),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData().copyWith(selectedColor: AppColors.lightActiveDrawerColor),
    timePickerTheme: const TimePickerThemeData(
        dayPeriodColor:  AppColors.lightActiveDrawerColor,
        dayPeriodTextColor: Colors.black
    ),
    colorScheme: const ColorScheme.light().copyWith(
      surface: AppColors.lightBackgroundColor,
      primary: Colors.black,
      secondary: Colors.grey,
      onSecondary: AppColors.lightSeconderBackgroundColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.darkSeconderBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    ),
    buttonTheme: const ButtonThemeData(alignedDropdown: true),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.darkBackgroundColor),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        alignment: Alignment.topLeft,
        elevation: const WidgetStatePropertyAll(8),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isCollapsed: true,
        isDense: true,
        constraints: BoxConstraints(maxHeight: 40, maxWidth: 250),
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        border: UnderlineInputBorder(),
      )
    ),
    dividerTheme: const DividerThemeData(color: AppColors.darkActiveDrawerColor),
    disabledColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonDarkColor,
          foregroundColor: Colors.black),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      iconColor: WidgetStateProperty.all(Colors.white),
    )),
    fontFamily: AppFonts.englishFontFamily,
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData().copyWith(selectedColor: AppColors.darkActiveDrawerColor),
    timePickerTheme: const TimePickerThemeData(
      dayPeriodColor:  AppColors.darkActiveDrawerColor,
      dayPeriodTextColor: Colors.white
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      surface: AppColors.darkBackgroundColor,
      primary: Colors.white,
      secondary: Colors.white,

      onSecondary: AppColors.darkSeconderBackgroundColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
  );

  static SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? _darkSystemUiOverlayStyle
          : _whiteSystemUiOverlayStyle;
  static final SystemUiOverlayStyle _whiteSystemUiOverlayStyle =
      SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppColors.lightBackgroundColor.withOpacity(0.85),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.lightBackgroundColor);
  static final SystemUiOverlayStyle _darkSystemUiOverlayStyle =
      SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: AppColors.darkBackgroundColor.withOpacity(0.85),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.darkBackgroundColor,
  );
}
