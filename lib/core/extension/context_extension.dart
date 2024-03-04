import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension ContextExtension on BuildContext{
  double get height=>MediaQuery.sizeOf(this).height;
  double get width=>MediaQuery.sizeOf(this).width;
  AppLocalizations get local=> AppLocalizations.of(this)!;
}
extension ThemeExtension on BuildContext{
  ThemeData get theme=>Theme.of(this);
  Color get scaffoldBackground=>Theme.of(this).colorScheme.background;
  Color get textPrimaryColor=>Theme.of(this).colorScheme.primary;
  Color get textSecondaryColor=>Theme.of(this).colorScheme.secondary;
}