import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension ContextExtension on BuildContext{
  double get height=>MediaQuery.sizeOf(this).height;
  double get width=>MediaQuery.sizeOf(this).width;
  AppLocalizations get local=> AppLocalizations.of(this)!;
  RouteSettings get route=>ModalRoute.of(this)!.settings;
  pop() =>Navigator.of(this).pop();
  pushNamed(String routeName,{Object? arguments})=>Navigator.of(this).pushNamed(routeName,arguments:arguments);
  pushReplacementNamed(String routeName,{Object? arguments})=>Navigator.of(this).pushReplacementNamed(routeName,arguments:arguments);
}
extension ThemeExtension on BuildContext{
  ThemeData get theme=>Theme.of(this);
  Color get scaffoldBackground=>Theme.of(this).colorScheme.surface;
  Color get textPrimaryColor=>Theme.of(this).colorScheme.primary;
  Color get textSecondaryColor=>Theme.of(this).colorScheme.secondary;
}