import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:notes/widgets/notes_counter.dart';
part 'default_deleted_appbar.dart';
part 'delete_options_appbar.dart';
class DeletedAppbar extends StatelessWidget {
  const DeletedAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      pinned: false,
      titleSpacing: 0,
      expandedHeight: 60,
      collapsedHeight: 60,
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      flexibleSpace: _DefaultDeletedAppbar(),
    );
  }
}

