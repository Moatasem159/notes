part of '../label_screen_body.dart';

class _PinnedLabeledNotesList extends StatelessWidget {
  const _PinnedLabeledNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLabeledNotesCubit, GetLabeledNotesStates>(
      builder: (context, state) {
        if (state is GetLabeledNotesSuccessState &&
            state.pinnedNotes.isNotEmpty) {
          return NotesList(
            length: state.pinnedNotes.length,
            itemBuilder: (context, index) => NoteWidget(
                note: state.pinnedNotes[index],
                index: index,
                noteStatus: NoteStatus.labeled),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
