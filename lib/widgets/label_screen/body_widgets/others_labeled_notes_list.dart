part of'../label_screen_body.dart';
class _OthersLabeledNotesList extends StatelessWidget {
  const _OthersLabeledNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState && state.notes.isNotEmpty) {
          return NotesList(notes: state.notes,noteStatus: NoteStatus.labeled);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}