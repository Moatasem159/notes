part of'default_options_appbar.dart';
class _PinNotesButton extends StatelessWidget {
  final NoteStatus noteStatus;
  const _PinNotesButton(this.noteStatus);
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is PinSuccessState) {
          AppBarCubit.of(context).removeSelection();
          if(noteStatus==NoteStatus.labeled)
            {
              GetLabeledNotesCubit.of(context).getLabeledNotes();
            }
         else if(noteStatus==NoteStatus.active) {
            GetActiveNotesCubit.of(context).getNotes();
          }
        }
        if(state is PinSuccessState&&noteStatus==NoteStatus.archive)
          {
            AppBarCubit.of(context).removeSelection();
            GetArchivedNotesCubit.of(context).getArchivedNotes();
          }
      },
     child: BlocBuilder<AppBarCubit, AppBarStates>(
       builder: (context, state) {
         return CustomIconButton(
             onTap: ()=> NotesActionsBloc.of(context).add(PinNote(AppBarCubit.of(context).selectedNotes, AppBarCubit.of(context).isPinned)),
             icon: Icon(AppBarCubit.of(context).isPinned ?Icons.push_pin_rounded:Icons.push_pin_outlined));
       },
     ),
    );
  }
}