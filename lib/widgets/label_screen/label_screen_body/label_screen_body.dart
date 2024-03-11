import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_labeled_notes_cubit/get_labeled_notes_cubit.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/widgets/label_screen/label_screen_appbar/label_appbar.dart';
import 'package:notes/widgets/note_lists/list_title.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
class LabelScreenBody extends StatelessWidget {
  const LabelScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        return CustomScrollList(
          slivers: [
              LabelAppbar(title: GetLabeledNotesCubit.of(context).label),
            if(state is GetLabeledNotesSuccessState &&state.pinnedNotes.isNotEmpty)
              ListTitle(title: context.local.pinned),
            if(state is GetLabeledNotesSuccessState &&state.pinnedNotes.isNotEmpty)
              NotesList(notes: state.pinnedNotes),
            if(state is GetLabeledNotesSuccessState &&state.notes.isNotEmpty)
              ListTitle(title: context.local.others),
            if(state is GetLabeledNotesSuccessState &&state.notes.isNotEmpty)
              NotesList(notes: state.notes),
            if(state is GetLabeledNotesSuccessState &&state.archivedNotes.isNotEmpty)
              ListTitle(title: context.local.archive),
            if(state is GetLabeledNotesSuccessState &&state.archivedNotes.isNotEmpty)
              NotesList(notes: state.archivedNotes),
            if(state is GetLabeledNotesSuccessState&& state.notes.isEmpty&&state.pinnedNotes.isEmpty&&state.archivedNotes.isEmpty)
              EmptyBody(title: context.local.labeledBodyTitle, icon: Icons.label_outline_rounded)
          ],
        );
      },
    );
  }
}