part of 'home_screen_body.dart';
class _OthersNotesList extends StatelessWidget {
  const _OthersNotesList();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      buildWhen: (previous, current) => current is GetActiveNotesSuccessState,
      builder: (context, state) {
        List<Note> notes = GetActiveNotesCubit.of(context).notes;
        return NotesList(
          length: notes.length,
          itemBuilder: (_, index) {
            Note ?note = notes.isNotEmpty?notes[index]:null;
            if (note!=null&&!note.pinned) {
              return NoteWidget(note: note, noteStatus: NoteStatus.active);
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}