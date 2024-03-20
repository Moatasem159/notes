part of'home_screen_body.dart';
class _PinnedNotesList extends StatelessWidget {
  const _PinnedNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        return NotesList(length:GetActiveNotesCubit.of(context).notes.length,
          itemBuilder: (_, index) {
            if(GetActiveNotesCubit.of(context).notes[index].pinned==true){
              return NoteWidget(note: GetActiveNotesCubit.of(context).notes[index],index: index,noteStatus: NoteStatus.active);
            }
            return const SizedBox();
          },);
      },
    );
  }
}