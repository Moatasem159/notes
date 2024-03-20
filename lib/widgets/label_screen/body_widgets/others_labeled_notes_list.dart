part of'../label_screen_body.dart';
class _OthersLabeledNotesList extends StatelessWidget {
  const _OthersLabeledNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState && state.notes.isNotEmpty) {
          return NotesList(
            length: state.notes.length,
            itemBuilder: (context, index) => NoteWidget(note: state.notes[index], index: index, noteStatus: NoteStatus.labeled));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}