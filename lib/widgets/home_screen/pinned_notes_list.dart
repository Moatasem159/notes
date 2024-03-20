part of'home_screen_body.dart';
class _PinnedNotesList extends StatelessWidget {
  const _PinnedNotesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActiveNotesCubit, GetActiveNotesStates>(
      builder: (context, state) {
        return NotesList(notes:GetActiveNotesCubit.of(context).notes,
          noteStatus: NoteStatus.active,itemBuilder: (_, index) {
            if(GetActiveNotesCubit.of(context).notes[index].pinned==true){
              return NoteWidget(isGrid: false, note: GetActiveNotesCubit.of(context).notes[index],index: index,noteStatus: NoteStatus.active);
            }
            return const SizedBox();
          },);
      },
    );
  }
}