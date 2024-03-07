import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/cubits/notes_actions_bloc/notes_actions_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu_item.dart';
import 'package:notes/widgets/notes_counter.dart';
part 'delete_popup_menu.dart';
part 'default_deleted_appbar.dart';
part 'delete_options_appbar.dart';
class DeletedAppbar extends StatelessWidget {
  const DeletedAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesActionsBloc(sl()),
      child: BlocBuilder<AppBarCubit, AppBarStates>(
        builder: (context, state) {
          return SliverAppBar(
            floating: true,
            pinned:!AppBarCubit.of(context).isBase,
            titleSpacing: 0,
            expandedHeight: 60,
            collapsedHeight: 60,
            backgroundColor: AppBarCubit.of(context).isBase?Colors.transparent:context.theme.colorScheme.onSecondary,
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            flexibleSpace: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: AppBarCubit
                  .of(context)
                  .isBase
                  ? const _DefaultDeletedAppbar()
                  : const _DeletedOptionsAppBar(),
            ),
          );
        },
      ),
    );
  }
}
