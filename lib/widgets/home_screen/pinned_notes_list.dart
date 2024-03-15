part of'home_screen_body.dart';
class _PinnedNotesList extends StatelessWidget {
  const _PinnedNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        if (state is GetActiveNotesSuccessState &&
            state.pinnedNotes.isNotEmpty) {
          return NotesList(
              notes: state.pinnedNotes, noteStatus: NoteStatus.active);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}