import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_active_notes_cubit/get_active_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/widgets/home_screen/home_screen_appbar/home_appbar.dart';
import 'package:notes/widgets/note_lists/list_title.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        return CustomScrollList(
          slivers: [
            const HomeAppBar(),
            if (state is GetActiveNotesSuccessState && state.pinnedNotes.isNotEmpty)
              ListTitle(title: context.local.pinned),
            if (state is GetActiveNotesSuccessState && state.pinnedNotes.isNotEmpty)
              NotesList(notes: state.pinnedNotes,noteStatus: NoteStatus.active),
            if (state is GetActiveNotesSuccessState && state.notes.isNotEmpty)
              ListTitle(title: context.local.others),
            if (state is GetActiveNotesSuccessState && state.notes.isNotEmpty)
            NotesList(notes: state.notes,noteStatus: NoteStatus.active),
            if (state is GetActiveNotesSuccessState && state.notes.isEmpty&&state.pinnedNotes.isEmpty)
            EmptyBody(title: context.local.homeBodyTitle,icon: Icons.lightbulb_outline_rounded)
          ],
        );
      },
    );
  }
}