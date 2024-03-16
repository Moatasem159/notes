part of'../label_screen_body.dart';
class _ArchivedLabeledNotesList extends StatelessWidget {
  const _ArchivedLabeledNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState &&
            state.archivedNotes.isNotEmpty) {
          return NotesList(notes: state.archivedNotes);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}