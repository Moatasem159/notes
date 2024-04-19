import 'package:flutter/material.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/note_lists/list_title.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
import 'package:notes/widgets/note_widget/note_widget.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/widgets/default_options_appbar/default_options_appbar.dart';
part 'home_appbar.dart';
part 'empty_notes.dart';
part 'others_notes_list.dart';
part 'others_list_title.dart';
part 'pinned_notes_list.dart';
part 'pinned_list_title.dart';
part 'default_home_appbar.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollList(
      slivers: [
        _HomeAppBar(),
        _PinnedListTitle(),
        _PinnedNotesList(),
        _OthersListTitle(),
        _OthersNotesList(),
        _EmptyNotes()
      ],
    );
  }
}