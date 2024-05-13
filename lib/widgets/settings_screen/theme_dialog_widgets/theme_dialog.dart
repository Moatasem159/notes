import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/theme_cubit/theme_cubit.dart';

class ThemeDialog extends StatefulWidget{
  const ThemeDialog({super.key});
  @override
  State<ThemeDialog> createState() => _ThemeDialogState();
}

class _ThemeDialogState extends State<ThemeDialog> {
  ThemeMode ?_selectedTheme;
  @override
  void initState() {
    super.initState();
    _selectedTheme = ThemeCubit.of(context).state;
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
      contentPadding:const EdgeInsets.only(bottom: 20),
      titlePadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      title: Text(context.local.chooseTheme,style: AppStyles.styleBold24(context)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          RadioListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 9),
            title: Text(context.local.light,style: AppStyles.styleRegular20(context)),
            value: ThemeMode.light,
            groupValue: _selectedTheme,
            onChanged: (value) {
              setState(() {
                _selectedTheme = value;
                ThemeCubit.of(context).toLight();
                context.pop();
              });
            },
          ),
          RadioListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 9),
            title: Text(context.local.dark,style: AppStyles.styleRegular20(context)),
            value: ThemeMode.dark,
            groupValue: _selectedTheme,
            onChanged: (value) {
              setState(() {
                _selectedTheme = value;
                ThemeCubit.of(context).toDark();
                context.pop();
              });
            },
          ),
          RadioListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 9),
            title: Text(context.local.systemDefault,style: AppStyles.styleRegular20(context)),
            value: ThemeMode.system,
            groupValue: _selectedTheme,
            onChanged: (value) {
              setState(() {
                _selectedTheme = value;
                ThemeCubit.of(context).toSystemDefault();
                context.pop();
              });
            },
          ),
        ],
      ),
      actions:[
        ElevatedButton (
          onPressed: context.pop,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
            foregroundColor: context.theme.iconTheme.color,
            backgroundColor: Colors.transparent,
          ),
          child: Text(context.local.cancel),
        ),
      ],
    );
  }
}