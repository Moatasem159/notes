part of'home_screen_body.dart';
class _OthersNotesList extends StatelessWidget {
  const _OthersNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        if (state is GetActiveNotesSuccessState && state.notes.isNotEmpty) {
          return NotesList(notes: state.notes, noteStatus: NoteStatus.active);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}