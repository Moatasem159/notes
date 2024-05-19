import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_fonts.dart';
abstract class AppStyles {
  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 16),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );
  }
  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 20),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );
  }
  static TextStyle styleRegular24(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 24),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );
  }
  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 16),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    );
  }
  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 16),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    );
  }
  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 20),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    );
  }
  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize:24),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.8,
    );
  }
  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 16),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    );
  }
  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 20),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    );
  }
  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 12),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 0
    );
  }
  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 24),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    );
  }
  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 14),
      fontFamily: AppFonts.englishFontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );
  }
  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, fontSize: 18),
      fontFamily: AppFonts.englishFontFamily,
      color: context.theme.colorScheme.primary.withOpacity(0.8),
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    );
  }
  static double _getResponsiveFontSize(context, {required double fontSize}) {
    double scaleFactor = _getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }
  static double _getScaleFactor(context) {
    double width = MediaQuery.sizeOf(context).width;
    return width / 550;
  }
}