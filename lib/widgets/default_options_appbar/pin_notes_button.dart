part of'default_options_appbar.dart';
class _PinNotesButton extends StatelessWidget {
  const _PinNotesButton();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesActionsBloc, NotesActionsState>(
      listener: (context, state) {
        if (state is ActionSuccessState) {
          AppBarCubit.of(context).removeSelection();
          GetActiveNotesCubit.of(context).getNotes();
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