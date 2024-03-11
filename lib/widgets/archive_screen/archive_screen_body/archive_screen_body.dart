import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/get_archived_notes_cubit/get_archived_notes_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/archive_screen/archive_screen_appbar/archive_appbar.dart';
import 'package:notes/widgets/custom_scroll_list.dart';
import 'package:notes/widgets/empty_body.dart';
import 'package:notes/widgets/note_lists/notes_list.dart';
class ArchiveScreenBody extends StatelessWidget {
  const ArchiveScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArchivedNotesCubit, GetArchivedNotesStates>(
      builder: (context, state) {
        if (state is GetArchivedNotesSuccessState &&
            state.archiveNotes.isNotEmpty) {
          return CustomScrollList(
            slivers: [
              const ArchiveAppbar(),
              NotesList(notes: state.archiveNotes,noteStatus: NoteStatus.archive)
            ],
          );
        }
        return CustomScrollList(
          slivers: [
            const ArchiveAppbar(),
            EmptyBody(
                title: context.local.archiveBodyTitle,
                icon: Icons.archive_outlined)
          ],
        );
      },
    );
  }
}
