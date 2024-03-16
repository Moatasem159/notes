import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/widgets/custom_drawer/main_drawer.dart';
import 'package:notes/widgets/deleted_screen/deleted_screen_body.dart';
class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDeletedNotesCubit(sl())..getDeletedNotes(),
      child: BlocBuilder<AppBarCubit, AppBarStates>(
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.systemUiOverlayStyle().copyWith(
                statusBarColor: AppBarCubit.of(context).isBase
                    ? context.scaffoldBackground
                    : context.theme.colorScheme.onSecondary),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: context.scaffoldBackground,
                drawer: const MainDrawer(),
                body: const DeletedScreenBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
