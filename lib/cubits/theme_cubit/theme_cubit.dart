import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  static ThemeCubit of (context)=> BlocProvider.of(context);
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return json['themeMode']=="light"?ThemeMode.light:json['themeMode']=="dark"?ThemeMode.dark:ThemeMode.system;
  }
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'themeMode': state==ThemeMode.light?"light":state==ThemeMode.dark?"dark":"system",
    };
  }
  _changeTheme(ThemeMode mode){
    emit(mode);
  }
  toLight()=>_changeTheme(ThemeMode.light);
  toDark()=>_changeTheme(ThemeMode.dark);
  toSystemDefault()=>_changeTheme(ThemeMode.system);
}