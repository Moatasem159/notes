import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/theme_cubit/theme_cubit.dart';
import 'package:notes/widgets/settings_screen/theme_dialog_widgets/theme_dialog.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: Scaffold(
        backgroundColor: context.scaffoldBackground,
        appBar: AppBar(),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (_) {
                    return const ThemeDialog();
                  },
                );
              },
              title: Text(
                context.local.theme,
                style: AppStyles.styleSemiBold20(context),
              ),
              trailing: BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, state) {
                  return Text(
                      state == ThemeMode.light
                          ? context.local.light
                          : state== ThemeMode.dark
                              ? context.local.dark
                              : context.local.systemDefault,
                      style: AppStyles.styleMedium20(context));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}