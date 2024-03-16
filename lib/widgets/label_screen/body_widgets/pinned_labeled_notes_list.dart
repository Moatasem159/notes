part of'../label_screen_body.dart';
class _PinnedLabeledNotesList extends StatelessWidget {
  const _PinnedLabeledNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState &&
            state.pinnedNotes.isNotEmpty) {
          return NotesList(notes: state.pinnedNotes);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}