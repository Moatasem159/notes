import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_deleted_notes_cubit/get_deleted_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/deleted_screen_appbar/deleted_appbar.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
class DeletedScreenBody extends StatelessWidget {
  const DeletedScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeletedNotesCubit, GetDeletedNotesStates>(
      builder: (context, state) {
        if (state is GetDeletedNotesSuccessState &&state.deletedNotes.isNotEmpty) {
          return CustomScrollList(
            slivers: [
              const DeletedAppbar(),
              NotesList(notes: state.deletedNotes,noteStatus: NoteStatus.deleted)
            ],
          );
        }
        return CustomScrollList(
          slivers: [
            const DeletedAppbar(),
            EmptyBody(
                title: context.local.archiveBodyTitle,
                icon: Icons.archive_outlined)
          ],
        );
      },
    );
  }
}