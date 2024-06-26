part of'archive_screen_body.dart';
class _ArchivedNotesList extends StatelessWidget {
  const _ArchivedNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArchivedNotesCubit, GetArchivedNotesStates>(
      builder: (context, state) {
        if (state is GetArchivedNotesSuccessState &&
            state.archiveNotes.isNotEmpty) {
          return NotesList(
            length: state.archiveNotes.length,
            itemBuilder: (context, index) => NoteWidget(note: state.archiveNotes[index],noteStatus: NoteStatus.archive));
        }
        return EmptyBody(
            title: context.local.archiveBodyTitle,
            icon: Icons.archive_outlined);
      },
    );
  }
}