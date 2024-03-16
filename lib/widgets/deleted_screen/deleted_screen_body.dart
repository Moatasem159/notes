import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/widgets/notes_counter.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:notes/cubits/notes_actions_bloc/notes_actions_bloc.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu_item.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
part 'deleted_appbar.dart';
part 'delete_popup_menu.dart';
part 'deleted_notes_list.dart';
part 'delete_options_appbar.dart';
part 'default_deleted_appbar.dart';
class DeletedScreenBody extends StatelessWidget {
  const DeletedScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollList(
      slivers: [
        _DeletedAppbar(),
        _DeletedNotesList(),
      ],
    );
  }
}