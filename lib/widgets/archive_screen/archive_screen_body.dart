import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
import 'package:notes/widgets/note_widget/note_widget.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/widgets/default_options_appbar/default_options_appbar.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
part 'archive_appbar.dart';
part 'archived_notes_list.dart';
part 'default_archive_appbar.dart';
class ArchiveScreenBody extends StatelessWidget {
  const ArchiveScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollList(
      slivers: [
        _ArchiveAppbar(),
        _ArchivedNotesList(),
      ],
    );
  }
}