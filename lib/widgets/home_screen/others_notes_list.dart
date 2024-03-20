part of'home_screen_body.dart';
class _OthersNotesList extends StatelessWidget {
  const _OthersNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        return NotesList(notes: GetActiveNotesCubit.of(context).notes, noteStatus: NoteStatus.active,itemBuilder: (context, index) {
          if(GetActiveNotesCubit.of(context).notes[index].pinned==false){
            return NoteWidget(isGrid: false, note: GetActiveNotesCubit.of(context).notes[index],index: index,noteStatus: NoteStatus.active);
          }
          return const SizedBox();
        });
      },
    );
  }
}