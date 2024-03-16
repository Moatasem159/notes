part of 'deleted_screen_body.dart';
class _DeletedNotesList extends StatelessWidget {
  const _DeletedNotesList();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeletedNotesCubit, GetDeletedNotesStates>(
      builder: (context, state) {
        if (state is GetDeletedNotesSuccessState &&
            state.deletedNotes.isNotEmpty) {
          return NotesList(
            notes: state.deletedNotes,
            noteStatus: NoteStatus.deleted,
          );
        }
        return EmptyBody(
          title: context.local.deletedBodyTitle,
          icon: Icons.delete_outline_outlined,
        );
      },
    );
  }
}