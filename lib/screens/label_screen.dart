import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/widgets/add_note_button/add_note_button.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/label_screen_appbar/label_appbar.dart';
class LabelScreen extends StatelessWidget {
  final String title;
  const LabelScreen({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppTheme.systemUiOverlayStyle().copyWith(
              statusBarColor: AppBarCubit.of(context).isBase
                  ? context.scaffoldBackground
                  : context.theme.colorScheme.onSecondary),
          child: SafeArea(
            child: Scaffold(
              drawer: const MainDrawer(),
              backgroundColor: context.scaffoldBackground,
              body: CustomScrollList(slivers: [LabelAppbar(title: title)]),
              floatingActionButton: const AddNoteButton(),
            ),
          ),
        );
      },
    );
  }
}