import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/config/lang/app_localizations_setup.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/switch_list_view_cubit/change_list_view_cubit.dart';
import 'package:notes/cubits/theme_cubit/theme_cubit.dart';

class Nota extends StatelessWidget {
  final AppRouter appRouter;
  const Nota({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => AppBarCubit()),
        BlocProvider(create: (context) => SwitchListViewCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (BuildContext context,ThemeMode state) {
          return MaterialApp(
            navigatorKey: AppRouter.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            initialRoute: Routes.homeRoute,
            onGenerateRoute: appRouter.router,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
          );
        },
      ),
    );
  }
}
